### TASK 8 ###

Create schema `AnimalsFarm`;

use `AnimalsFarm`;

CREATE TABLE AnimalTypes
(
	Id INT AUTO_INCREMENT PRIMARY KEY, 
	type_name VARCHAR(20)
);

INSERT INTO AnimalTypes (type_name)
VALUES  ('home_animal'),
		('pack_animal');  

CREATE TABLE HomeAnimalTypes
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR (20),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES AnimalTypes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO HomeAnimalTypes (type_name, type_id)
VALUES  ('Cat', 1),
		('Dog', 1),  
		('Hamster', 1); 

CREATE TABLE PackAnimalTypes
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR (20),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES AnimalTypes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO PackAnimalTypes (type_name, type_id)
VALUES ('Horse', 2),
	   ('Camel', 2),  
	   ('Donkey', 2); 
    

drop table if exists cats;
create table cats (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20),
    Command VARCHAR(20),
    Birthday DATE,
	Type_id INT,
    Foreign KEY (Type_id) REFERENCES HomeAnimalTypes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists dogs;
create table dogs (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20),
    Command VARCHAR(20),
    Birthday DATE,
	Type_id INT,
    Foreign KEY (Type_id) REFERENCES HomeAnimalTypes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists hamsters;
create table hamsters (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20),
    Command VARCHAR(20),
    Birthday DATE,
	Type_id INT,
    Foreign KEY (Type_id) REFERENCES HomeAnimalTypes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);


drop table if exists horses;
create table horses (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20),
    Command VARCHAR(20),
	lift_weight INT,
	Birthday DATE,
	Type_id INT,
    Foreign KEY (Type_id) REFERENCES PackAnimalTypes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists camels;
create table camels (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20),
    Command VARCHAR(20),
	lift_weight INT,
	Birthday DATE,
	Type_id INT,
    Foreign KEY (Type_id) REFERENCES PackAnimalTypes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists donkeys;
create table donkeys (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20),
    Command VARCHAR(20),
	lift_weight INT,
	Birthday DATE,
	Type_id INT,
    Foreign KEY (Type_id) REFERENCES PackAnimalTypes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);


### TASK 9 ###
    
insert into cats (Name, Command, Birthday) values
    ('Кот_1', 'Мурчать', '2023-01-01', 1),
    ('Кот_2', 'Спать', '2023-02-01', 1),
	('Кот_3', 'Играть', '2023-03-01', 1);

insert into dogs (Name, Command, Birthday) values
    ('Собака_1', 'Лапу', '2023-01-11', 2),
    ('Собака_2', 'Лежать', '2023-02-11', 2),
	('Собака_3', 'Сидеть', '2023-03-11', 2);

insert into hamsters (Name, Command, Birthday) values
    ('Хомяк_1', 'Жевать', '2023-01-12', 3),
    ('Хомяк_2', 'Бегать в колесе', '2023-02-12', 3),
	('Хомяк_3', 'Спать', '2023-03-12', 3);

insert into camels (Name, Command, lift_weight, Birthday) values
    ('Верблюд_1', 'Жевать', 100, '2023-01-12', 2),
    ('Верблюд_2', 'Плевать', 150, '2023-03-13', 2),
	('Верблюд_3', 'Поднять', 50, '2023-04-14', 2);
	
insert into horses (Name, Command, lift_weight, Birthday) values
    ('Лошадь_1', 'Бить копытом', 100, '2023-01-02', 1),
    ('Лошадь_2', 'Ржать', 50, '2023-02-02', 1),
	('Лошадь_3', 'Скакать', 150, '2023-03-02', 1);
	
insert into donkeys (Name, Command, lift_weight, Birthday) values
    ('Осел_1', 'Жевать', 20, '2023-01-01', 3),
    ('Осел_2', 'Упираться', 10, '2023-01-01', 3),
	('Осел_3', 'Тащить груз', 20, '2023-01-01', 3);
	
### TASK 10 ###
	
 
delete from camels where id > 0;
 
drop table if exists PackAnimals; 
create table PackAnimals (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY) # общая таблица для вьючных животных
select  Name, 
        Command,		
        Birthday
from horses union 
select  Name, 
        Command,		
        Birthday
from donkeys;

drop table if exists HomeAnimals; 
create table HomeAnimals (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY) # общая таблица для домашних животных
select  Name, 
        Command,		
        Birthday
from cats union 
select  Name, 
        Command,		
        Birthday
from dogs union 
select  Name, 
        Command,		
        Birthday
from hamsters;

drop table if exists HumanFriends;  # Общая таблица для животных 
create table HumanFriends (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY) # общая таблица для домашних животных
select  Name, 
        Command,		
        Birthday
from HomeAnimals union 
select  Name, 
        Command,		
        Birthday
from PackAnimals;


### TASK 11 ###

drop table if exists YoungAnimals;
create table YoungAnimals (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
select Name, 
        Command, 
        Birthday,
        Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) as age
from HumanFriends
where Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) > 1 
	and Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) < 3;

### TASK 12 ###

