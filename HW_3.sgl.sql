--- 1. Вывести всех работников чьи должностя есть в базе, вместе с должностями.
select e.employee_name, r.role_name from employees e
left join roles_employee re on e.id = re.employee_id  
left join roles r on re.role_id = r.id;

--- 2. Вывести всех работников у которых ЗП меньше 2000.
select id, employee_name from employees
where id in(
select id from salart_of_employee
where salary_id in(
select id from salary
where monthly_salary <2000));

---3. Вывести все зарплатные позиции, но работник по ним не назначен. 
---(ЗП есть, но не понятно кто её получает.)

---решение с помощию функции Join и алиасов
select w.id, w.name, s.sum_salary from workers w
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
where name is null;

---решение с помощию вложенного подзапроса где вывелись только заплаты с не назначенными работниками.
select sum_salary from s_alary
where id in(
select salary_id from worker_salary
where id in(
select Id from workers
where name is null));

---решение с помощию коррелированного вложенного запроса, вывелись сотрудники, id сотрудников и id зарплат неназначенных сотрудников.
select id, name,
(select salary_id from worker_salary
where worker_id = workers.id )
from workers
where name is null;

---4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
---(ЗП есть, но не понятно кто её получает.)
select w.id as WorkerId, w.name, s.id as SalaryId, s.sum_salary from workers w
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
where sum_salary <2000 and name is null;

--- 5. Найти всех работников кому не начислена ЗП.
select w.id as WorkerId, w.name, s.sum_salary from workers w
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
where sum_salary is null;

--- 6. Вывести всех работников с названиями их должности.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on wp.position_id = p.id;

--- 7. Вывести имена и должность только Java разработчиков.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Java developer';

---8. Вывести имена и должность только Python разработчиков.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Python developer';

--- 9. Вывести имена и должность всех QA инженеров.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%QA%';

---10. Вывести имена и должность ручных QA инженеров.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%Manual QA%';

---11. Вывести имена и должность автоматизаторов QA
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Automation QA%';

--- 12. Вывести имена и зарплаты Junior специалистов
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Junior%';

---13. Вывести имена и зарплаты Middle специалистов
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Middle%';

---14. Вывести имена и зарплаты Senior специалистов
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Senior%';

--- 15. Вывести зарплаты Java разработчиков
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Java%';

--- 16. Вывести зарплаты Python разработчиков
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%Python%';

---17. Вывести имена и зарплаты Junior Python разработчиков
select w.name, p.position_name, s.sum_salary from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like 'Junior Python developer';

--- 18. Вывести имена и зарплаты Middle JS разработчиков
select w.name, s.sum_salary, p.position_name from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id 
left join p_osition p on wp.position_id = p.id
where p.position_name like 'Middle JavaScript developer';

--- 19. Вывести имена и зарплаты Senior Java разработчиков
select w.name, s.sum_salary, p.position_name from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like 'Senior Java developer';

 ---20. Вывести зарплаты Junior QA инженеров
select s.sum_salary, p.position_name from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id
where p.position_name like 'Junior % QA engineer'


 ---21. Вывести среднюю зарплату всех Junior специалистов
select avg(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Junior%';

 ---22. Вывести сумму зарплат JS разработчиков
select sum(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%JavaScript developer';

 ---23. Вывести минимальную ЗП QA инженеров
select min(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%QA engineer';

 ---24. Вывести максимальную ЗП QA инженеров
select max(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%QA engineer';

---25. Вывести количество QA инженеров
select count(position_name) as Count_QA_engineer from p_osition
where position_name like '%QA engineer';

---26. Вывести количество Middle специалистов.
select count(position_name) as Count_Middle_Spec from p_osition 
where position_name like 'Middle%';

---27. Вывести количество разработчиков
select count(position_name) as Count_Developer from p_osition 
where position_name like '%developer';

--- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%developer';

--- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select w.name, p.position_name, s.sum_salary from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on p.id = wp.position_id 
left join worker_salary ws on ws.worker_id = w.id 
left join s_alary s on ws.salary_id = s.id
order by s.sum_salary;

--- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select w.name, p.position_name, s.sum_salary from workers w 
left join worker_position wp ON w.id = wp.worker_id 
left join p_osition p on p.id = wp.position_id 
left join worker_salary ws on ws.worker_id = w.id 
left join s_alary s  on ws.salary_id = s.id
where s.sum_salary >= 1700 and s.sum_salary <=2300
order by s.sum_salary;

---31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select w.name, p.position_name, s.sum_salary from workers w
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on p.id = wp.position_id 
left join worker_salary ws on ws.worker_id = w.id 
left join s_alary s on ws.salary_id = s.id 
where s.sum_salary < 2300
order by s.sum_salary;

--- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select w.name, p.position_name, s.sum_salary from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on p.id = wp.position_id 
left join worker_salary ws on ws.worker_id = w.id 
left join s_alary s on ws.salary_id = s.id 
where s.sum_salary = 1100 or s.sum_salary = 1500 or s.sum_salary = 2000

select * from p_osition 
select * from workers 
select * from worker_salary 
select * from worker_position 
select * from s_alary 
--- Для выполнения задания выполнил следующие действия:

---создал таблицу workers
create table workers(
	id serial primary key, Name varchar(50)
);

---наполнил ее данными
insert into workers(Name)
values(N'Кондратьев Ипат Федотович'),
	(N'Кондратьев Ипат Федотович'),
	(N'Вероника Альбертовна Васильева'),
	(N'Никифорова Нина Леонидовна'),
	(N'Ефимова Агата Сергеевна'),
	(N'Агата Наумовна Игнатова'),
	(N'Яковлев Исидор Ефстафьевич'),
	(N'Гуляева Лидия Юрьевна'),
	(null),
	(N'Игнатий Иосифович Иванов'),
	(N'Виссарион Жоресович Ефимов'),
	(N'Ангелина Ильинична Мишина'),
	(N'Кудрявцев Иннокентий Гавриилович'),
	(N'Суворов Варлаам Богданович'),
	(null),
	(N'Силина Агафья Александровна'),
	(N'Прохорова Галина Харитоновна'),
	(N'Осипов Ратмир Изотович'),
	(null),
	(N'Горбачева Ульяна Даниловна'),
	(N'Потапова Эмилия Валентиновна'),
	(null),
	(N'Ширяева Галина Робертовна'),
	(N'Полякова Валентина Юрьевна'),
	(N'Наталья Святославовна Крылова'),
	(N'Элеонора Александровна Давыдова'),
	(N'Элеонора Александровна Давыдова'),
	(N'Сидор Фомич Дементьев'),
	(N'Рожкова Ангелина Валентиновна'),
	(null),
	(null),
	(N'Романов Данила Даниилович'),
	(N'Белова Валентина Эльдаровна'),
	(N'Лапин Самсон Венедиктович'),
	(N'Субботин Наркис Дорофеевич'),
	(null),
	(N'Брагин Андроник Валерьянович'),
	(null),
	(N'Милица Валериевна Лукина'),
	(N'Прохорова Варвара Егоровна'),
	(N'Полина Антоновна Исаева'),
	(N'Мариан Артемьевич Афанасьев'),
	(N'Дарья Рудольфовна Ореховa'),
	(N'Ярополк Марсович Воробьев'),
	(N'Громов Аверкий Изотович'),
	(null),
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
	(N'Самойлов Стоян Дмитриевич'),
	(null);
---создал разаязачную таблицу s_alary
create table s_alary(
id serial primary key,
sum_salary int
);

---наполнил таблицу s_alary
insert into s_alary(sum_salary)
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
	(2500),
	(null);

---создал таблицу worker_salary
create table worker_salary(
id serial primary key,
worker_id int unique,
salary_id int,
foreign key (worker_id)
references workers(id),
foreign key (salary_id)
references s_alary(id)
);

---наполнил таблицу worker_salary
insert into worker_salary(worker_id, salary_id)
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
	(25, 15),
	(31, 11),
	(32, null),
	(33, null),
	(34, null),
	(35, null),
	(36, 3),
	(37, null),
	(38, 10),
	(39, null),
	(40, null),
	(41, null),
	(42, null),
	(43, null),
	(44, null),
	(45, null),
	(46, 12),
	(47, null),
	(48, null),
	(49, null),
	(50, null),
	(51, null),
	(52, null),
	(53, null),
	(54, null),
	(55, null),
	(56, null),
	(57, null),
	(58, null),
	(59, null),
	(60, null),
	(61, null),
	(62, null),
	(63, null),
	(64, null),
	(65, null),
	(66, null),
	(67, null),
	(68, null),
	(69, null),
	(70, null),
	(71, null),
	(72, null),
	(73, null),
	(74, null),
	(75, null),
	(76, null),
	(77, null),
	(78, null),
	(79, null),
	(80, null),
	(81, 5);

---создал таблицу p_osition
create table p_osition(
	id serial primary key,
	position_name varchar(50)
);

---заполнил таблицу p_osition
insert into p_osition(position_name)
values('Junior Python developer'),
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

---создал развязачную таблицу worker_position
 create table worker_position(
id serial primary key,
worker_id int unique,
position_id int,
foreign key (worker_id)
references workers(id),
foreign key (position_id)
references p_osition(id)
);

---заполнил позицию worker_position
insert into worker_position(worker_id, position_id)
values(1, 5),
	(5, 1),
	(38, 16),
	(14, 3),
	(65, 12),
	(19, 10),
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

