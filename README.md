1) Изначальное состояние VM.
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/1.png

2)  Добавляем диск в VM.
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/2.png

3) Создаём на нём 4 сектора.
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/3.png

4) Собираем RAID10 из 4 дисков.
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/4.png

5) Создаём файловую систему и монтируем.
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/6.png

6) Помечаем sdb4 как сломанный, md10 продолжает работать, но в статусе “degraded”.
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/5.png

7) Удаляем sdb4, md10 продолжает работать, но в статусе “degraded”.
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/7.png

8) Возвращаем sdb4, md10 записывает данные и возвращается к статусу “clean”.
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/8.png
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/94e6a658628749bc185844a096f4c31c20920b57/9.png
