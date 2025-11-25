1) Создаём 4 файловых системы в рамках zpool. На каждой включён свой алгоритм сжатия:
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/1.png
   
2) Результат копирования одной и той же пачки логов в файловые системы с разным сжатием:
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/2.png
   Лучше всего справился алгоритм “gzip”. + ему ещё и можно установить степень сжатия.
   
3) Импортируем zpool:
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/3.png

4) Добавляем новое блочное устройство в pool для увеличения размера хранилища:
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/4.png

5) Тип pool “mirror” был задан при создании:
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/5.png

6) Установка нового значения блоков:
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/6.png

7) Включёны разные алгоритмы сжатия:
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/7.png

8) Включена дефолтная контрольная сумма:
   https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/8.png

9) Делаем snapshot в таком состоянии и удаляем dpkg.log:
    https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/9.png
    https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/10.png

10) Отправляем snapshot на другую машину, которая его принимает и разворачивает в подготовленный zpool из него бэкап с содержимым, в котором есть восстановленный dpkg.log:
    https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/11.png
    https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/12.png

11) Включаем шифрование дефолтным алгоритмом по паролю:
    https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/13.png

12) Вводим пароль для доступа к данным на sec5:
    https://github.com/UtochkaJZX100/Professional-homeworks/blob/b33446da6d7128355401c17b8abcee7162e50c2a/14.png
