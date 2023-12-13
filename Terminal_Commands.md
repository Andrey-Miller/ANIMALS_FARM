## Задание 1-2
![terminal](https://github.com/Andrey-Miller/ANIMALS_FARM/assets/11994441/d05c1b9f-c5b2-44d2-9828-8ac347d3920f)
## Задание 3
sinedd@sinedd-dsk:\~$ sudo apt install mysql-server mysql-client

sinedd@sinedd-dsk:\~$ sudo apt-get update
## Задание 4

Установка

sinedd@sinedd-dsk:\~$ wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb

sinedd@sinedd-dsk:\~$ sudo dpkg -i mysql-apt-config_0.8.24-1_all.deb

sinedd@sinedd-dsk:\~$ sudo apt install mysql-server

sinedd@sinedd-dsk:\~$ sudo mysql_secure_installation

sinedd@sinedd-dsk:\~$ sudo apt-get install mysql-workbench-community

Удаление

sinedd@sinedd-dsk:\~$ sudo dpkg -s mysql-server

sinedd@sinedd-dsk:\~$ sudo dpkg -r mysql-workbench-community

sinedd@sinedd-dsk:\~$ sudo dpkg -r mysql-community-server
