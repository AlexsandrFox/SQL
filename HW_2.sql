--- Создать таблицу employees. С параметрами : id, employee_Name.
create table employees(
	id serial primary key, employee_Name varchar(50) not null
);
 


---Создать таблицу salary. С параметрами : id, monthly_salary.
create table salary(
	id serial primary key,
	monthly_salary int not null
);

---Создать таблицу employee_salary. С параметрами : id, employee_id, salary_id.
create table employee_salary(
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null
);

---Создать таблицу roles. С параметрами : id, role_name.

create table roles(
	id serial primary key,
	role_name int unique not null
);



---Заполнить таблицу employees 70 строками.
insert into employees(employee_Name)
values(N'Кондратьев Ипат Федотович'),
	(N'Кондратьев Ипат Федотович'),
	(N'Вероника Альбертовна Васильева'),
	(N'Никифорова Нина Леонидовна'),
	(N'Ефимова Агата Сергеевна'),
	(N'Агата Наумовна Игнатова'),
	(N'Яковлев Исидор Ефстафьевич'),
	(N'Гуляева Лидия Юрьевна'),
	(N'Игнатий Иосифович Иванов'),
	(N'Виссарион Жоресович Ефимов'),
	(N'Ангелина Ильинична Мишина'),
	(N'Кудрявцев Иннокентий Гавриилович'),
	(N'Суворов Варлаам Богданович'),
	(N'Силина Агафья Александровна'),
	(N'Прохорова Галина Харитоновна'),
	(N'Осипов Ратмир Изотович'),
	(N'Горбачева Ульяна Даниловна'),
	(N'Потапова Эмилия Валентиновна'),
	(N'Ширяева Галина Робертовна'),
	(N'Полякова Валентина Юрьевна'),
	(N'Наталья Святославовна Крылова'),
	(N'Элеонора Александровна Давыдова'),
	(N'Элеонора Александровна Давыдова'),
	(N'Сидор Фомич Дементьев'),
	(N'Рожкова Ангелина Валентиновна'),
	(N'Романов Данила Даниилович'),
	(N'Белова Валентина Эльдаровна'),
	(N'Лапин Самсон Венедиктович'),
	(N'Субботин Наркис Дорофеевич'),
	(N'Брагин Андроник Валерьянович'),
	(N'Милица Валериевна Лукина'),
	(N'Прохорова Варвара Егоровна'),
	(N'Полина Антоновна Исаева'),
	(N'Мариан Артемьевич Афанасьев'),
	(N'Дарья Рудольфовна Ореховa'),
	(N'Ярополк Марсович Воробьев'),
	(N'Громов Аверкий Изотович'),
	(N'Овчинникова Варвара Евгеньевна'),
	(N'Феврония Дмитриевна Турова'),
	(N'Борисов Кузьма Игнатович'),
	(N'Владислав Демьянович Фадеев'),
	(N'Акулина Григорьевна Шилова'),
	(N'Фока Давидович Тарасов'),
	(N'Кира Артемовна Костина'),
	(N'Куликова Нинель Геннадьевна'),
	(N'Лукия Мироновна Титова'),
	(N'Туров Клавдий Всеволодович'),
	(N'Валентина Львовна Рогова'),
	(N'Тмиратьяна Валентиновна Смолнова'),
	(N'Любомир Архипович Шилов'),
	(N'Петухов Спартак Ааронович'),
	(N'Степанова Милица Константиновна'),
	(N'Шаров Мина Германович'),
	(N'Тимофеева Вера Ниловна'),
	(N'Назар Димитриевич Козлов'),
	(N'Герасимова Евдокия Ефимовна'),
	(N'Панфилов Филимон Брониславович'),
	(N'Зосима Исидорович Сысоев'),
	(N'Егор Юльевич Голубев'),
	(N'Рогова Пелагея Игоревна'),
	(N'Олимпиада Артемовна Кудрявцева'),
	(N'Фока Владиславович Тимофеев'),
	(N'Феофан Анатольевич Беляков'),
	(N'Ипат Фёдорович Афанасьев'),
	(N'Людмила Михайловна Силина'),
	(N'Евдокимова Валентина Вадимовна'),
	(N'Наумов Корнил Адрианович'),
	(N'Новикова Елена Сергеевна'),
	(N'Зоя Ильинична Козлова'),
	(N'Субботин Панкратий Зиновьевич'),
	(N'Самойлов Стоян Дмитриевич');

insert into employees(employee_Name)
values (' '),
	(' '),
	(' '),
	(' '),
	(' '),
	(' '),
	(' '),
	(' '),
	(' '),
	(' ');

---Наполнить таблицу salary 15 строками.
insert into salary(monthly_salary)
values(1000),
	(1100),
	(1200),
	(1300),
	(1400),
	(1500),
	(1600),
	(1700),
	(1800),
	(1900),
	(2000),
	(2100),
	(2200),
	(2300),
	(2400),
	(2500);

---Наполнить таблицу employee_salary 40 строками:
---в 10 строк из 40 вставить несуществующие employee_id.

insert into employee_salary(employee_id, salary_id)
values (1, 2),
	(2, 5),
	(3, 10),
	(4, 15),
	(5, 4),
	(6, 3),
	(7, 5),
	(8, 9),
	(9, 15),
	(99, 6),
	(11, 7),
	(12, 12),
	(13, 14),
	(14, 13),
	(86, 1),
	(16, 8),
	(101, 10),
	(18, 13),
	(19, 2),
	(20, 5),
	(96, 6),
	(22, 8),
	(23, 9),
	(24, 5),
	(78, 7),
	(26, 14),
	(27, 14),
	(28, 6),
	(80, 3),
	(30, 9),
	(73, 2),
	(29, 1),
	(21, 13),
	(15, 12),
	(10, 11),
	(17, 5),
	(25, 15),
	(95, 7),
	(82, 9),
	(79, 9);

---Поменять тип столба role_name с int на varchar(30).
alter table roles
alter column role_name type varchar(30) using role_name::varchar(30);



---Наполнить таблицу roles 20 строками.
insert into roles(role_name)
values ('Junior Python developer'),
	('Middle Python developer'),
	('Senior Python developer'),
	('Junior Java developer'),
	('Middle Java developer'),
	('Senior Java developer'),
	('Junior JavaScript developer'),
	('Middle JavaScript developer'),
	('Senior JavaScript developer'),
	('Junior Manual QA engineer'),
	('Middle Manual QA engineer'),
	('Senior Manual QA engineer'),
	('Project Manager'),
	('Designer'),
	('HR'),
	('CEO'),
	('Sales manager'),
	('Junior Automation QA engineer'),
	('Middle Automation QA engineer'),
	('Senior Automation QA engineer');

---Создать таблицу roles_employee. 
---- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id).

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id  int not null,
	foreign key (employee_id)
	references employees(id),
	foreign key (role_id)
	references roles(id)
);

create table salart_of_employee(
	id serial primary key,
	emloyee_id int not null unique,
	salary_id int not null,
	foreign key (emloyee_id)
	references employees(id),
	foreign key (salary_id)
	references salary(id) 
);



insert into salary(monthly_salary)
values (0);

insert into salart_of_employee(emloyee_id, salary_id)
values (31, 18),
	(32, 18),
	(33, 18),
	(34, 18),
	(35, 18),
	(36, 18),
	(37, 18),
	(38, 18),
	(39, 18),
	(40, 18),
	(41, 18),
	(42, 18),
	(43, 18),
	(44, 18),
	(45, 18),
	(46, 18),
	(47, 18),
	(48, 18),
	(49, 18),
	(50, 18),
	(51, 18),
	(52, 18),
	(53, 18),
	(54, 18),
	(55, 18),
	(56, 18),
	(57, 18),
	(58, 18),
	(59, 18),
	(60, 18),
	(61, 18),
	(62, 18),
	(63, 18),
	(64, 18),
	(65, 18),
	(66, 18),
	(67, 18),
	(68, 18),
	(69, 18),
	(70, 18);

select * from salary;
select * from employees;

insert into salart_of_employee(emloyee_id, salary_id)
values (72, 3),
	(73, 5),
	(74, 11),
	(75, 8),
	(76, 6),
	(77, 15),
	(78, 2),
	(79, 4),
	(80, 7),
	(81, 10);
insert into salart_of_employee(emloyee_id, salary_id)
values (1, 2),
	(2, 5),
	(3, 10),
	(4, 15),
	(5, 4),
	(6, 3),
	(7, 5),
	(8, 9),
	(9, 15),
	(11, 7),
	(12, 12),
	(13, 14),
	(14, 13),
	(16, 8),
	(18, 13),
	(19, 2),
	(20, 5),
	(22, 8),
	(23, 9),
	(24, 5),
	(26, 14),
	(27, 14),
	(28, 6),
	(30, 9),
	(29, 1),
	(21, 13),
	(15, 12),
	(10, 11),
	(17, 5),
	(25, 15);

---Наполнить таблицу roles_employee 40 строками.
insert into roles_employee(employee_id, role_id)
values (1, 5),
	(5, 1),
	(38, 16),
	(14, 3),
	(65, 12),
	(19, 17),
	(9, 20),
	(25, 13),
	(53, 7),
	(10, 8),
	(29, 15),
	(50, 2),
	(44, 10),
	(36, 8),
	(22, 5),
	(7, 6),
	(17, 9),
	(40, 11),
	(52, 14);

select * from salart_of_employee;
show tables from qa_ddl_26_19


