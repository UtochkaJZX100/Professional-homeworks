#!/bin/bash

#Вводим переменные
LOG_FILE="/var/log/nginx/access.log"
LAST_RUN_FILE="/var/lib/myscript/last_run_timestamp.txt"
OUTPUT_FILE="/var/log/myscript/new_logs.txt"


#Получаем текущее время в формате Unix timestamp
CURRENT_TIMESTAMP=$(date +%s)

#Проверяем время последнего запуска 
if [[ -f "$LAST_RUN_FILE" ]]; then
    LAST_RUN=$(cat "$LAST_RUN_FILE" 2>/dev/null)
    if [[ -z "$LAST_RUN" || "$LAST_RUN" -le 0 ]]; then
        LAST_RUN=0
    fi
else
    LAST_RUN=0
fi

#Перезаписываем финальный файл, чтобы очистить его содержимое
> "$OUTPUT_FILE"

#Обрабатываем каждую строку лога
while IFS= read -r line || [[ -n "$line" ]]; do
    
#Извлекаем временную метку из строки лога (формат: [16/Dec/2025:10:00:00 +0300])
if [[ "$line" =~ \[([0-9]{2}/[A-Za-z]{3}/[0-9]{4}:[0-9]{2}:[0-9]{2}:[0-9]{2})\ [^]]+\] ]]; then
   log_time_str="${BASH_REMATCH[1]}"  
        
        #Преобразуем строку времени в Unix timestamp (производим замену "/" и ":" на пробел, чтобы получить: 16 Dec 2025 10 00 00)
        parsed_time=$(echo "$log_time_str" | sed 's/\// /g; s/:/ /g')
        log_timestamp=$(date -d "$parsed_time" +%s 2>/dev/null)
        
        #Если время успешно преобразовано и больше последнего запуска — пишем в выход
        if [[ -n "$log_timestamp" && "$log_timestamp" -gt "$LAST_RUN" ]]; then
            echo "$line" >> "$OUTPUT_FILE"
        fi
    else
        #Если временная метка не найдена — пропускаем
        continue
    fi
done < "$LOG_FILE"

#Сохраняем текущее время как время последнего запуска
echo "$CURRENT_TIMESTAMP" > "$LAST_RUN_FILE"

echo "Новые записи сохранены в: $OUTPUT_FILE"
echo "Обработано до: $(date -d "@$CURRENT_TIMESTAMP")"

#Сохраняем файл с 10 самыми частыми IP-адресами
awk '{print $1}' "$OUTPUT_FILE" | sort | uniq -c | sort -nr | head -10 > /home/otus/max_zapros_ip

#Сохраняем файл с 10 самымии запрашиаемыми URL
awk '{print $8}' "$OUTPUT_FILE" | sort | uniq -c | sort -nr | head -10 > /home/otus/max_zapros_url

#Сохраняем файл с ошибками веб-сервера
cat /var/log/nginx/error.log > /home/otus/errors

#Сохраняем файл с HTTP-кодами ответов, сортируя их по количеству
awk '{print $9}' "$OUTPUT_FILE" | sort | uniq -c | sort -nr > /home/otus/http_codes

#Создаём единый отчёт 
cat /home/otus/max_zapros_ip /home/otus/max_zapros_url /home/otus/errors /home/otus/http_codes > /home/otus/otchet

#Отправка письма на почту через почтовый клиент "mutt"
echo "Ежечасный отчёт по работе nginx" | mutt -s "Мониторинг nginx" -a /home/otus/otchet -- mav@ves.city
