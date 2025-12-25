#!/bin/bash

#Перебираем каталоги в /proc, содержащие в себе цифры, указывающие на  PID процесса и извлекаем его
for pd in /proc/[0-9]*; do pid=$(basename "$pd")


    #Создаём массив на основе stat
    read -r -a stat_array < "$pd/stat"

    #Извлекаем поля PID и STATUS
    pid_stat=${stat_array[0]}  #PID
    stat=${stat_array[2]}      #Статус, в котором находится процесс

    # Определяем TTY (поле 7 в stat — номер устройства)
    tty_nr=${stat_array[6]}
    if [[ "$tty_nr" == "0" ]]; then
        tty="?"
    fi

    # Читаем командную строку, запускающую процесс с соответствующим PID
    if read -r -d '' cmd < "$pd/cmdline"; then
        # Если команда пустая, берём имя из stat (поле 1)
        if [[ -z "$cmd" ]]; then
            cmd="${stat_array[1]//\(/}"
            cmd="${cmd//\)/}"
        fi
    else
        cmd="<unknown>"
    fi

    # Вывод в формате: PID  TTY  STAT  CMD
    printf "%-6s %-8s %-6s %-10s %s\n" "$pid" "$tty" "$stat" "$cmd"
done
