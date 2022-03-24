--- 1. ������� ���� ���������� ��� ��������� ���� � ����, ������ � �����������.
select e.employee_name, r.role_name from employees e
left join roles_employee re on e.id = re.employee_id  
left join roles r on re.role_id = r.id;

--- 2. ������� ���� ���������� � ������� �� ������ 2000.
select id, employee_name from employees
where id in(
select id from salart_of_employee
where salary_id in(
select id from salary
where monthly_salary <2000));

---3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. 
---(�� ����, �� �� ������� ��� � ��������.)

---������� � ������� ������� Join � �������
select w.id, w.name, s.sum_salary from workers w
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
where name is null;

---������� � ������� ���������� ���������� ��� �������� ������ ������� � �� ������������ �����������.
select sum_salary from s_alary
where id in(
select salary_id from worker_salary
where id in(
select Id from workers
where name is null));

---������� � ������� ���������������� ���������� �������, �������� ����������, id ����������� � id ������� ������������� �����������.
select id, name,
(select salary_id from worker_salary
where worker_id = workers.id )
from workers
where name is null;

---4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. 
---(�� ����, �� �� ������� ��� � ��������.)
select w.id as WorkerId, w.name, s.id as SalaryId, s.sum_salary from workers w
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
where sum_salary <2000 and name is null;

--- 5. ����� ���� ���������� ���� �� ��������� ��.
select w.id as WorkerId, w.name, s.sum_salary from workers w
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
where sum_salary is null;

--- 6. ������� ���� ���������� � ���������� �� ���������.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on wp.position_id = p.id;

--- 7. ������� ����� � ��������� ������ Java �������������.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Java developer';

---8. ������� ����� � ��������� ������ Python �������������.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Python developer';

--- 9. ������� ����� � ��������� ���� QA ���������.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%QA%';

---10. ������� ����� � ��������� ������ QA ���������.
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%Manual QA%';

---11. ������� ����� � ��������� ��������������� QA
select w.id as WorkerId, w.name, p.id as PositionId, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Automation QA%';

--- 12. ������� ����� � �������� Junior ������������
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Junior%';

---13. ������� ����� � �������� Middle ������������
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Middle%';

---14. ������� ����� � �������� Senior ������������
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Senior%';

--- 15. ������� �������� Java �������������
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Java%';

--- 16. ������� �������� Python �������������
select w.name, s.sum_salary, p.position_name from workers w
left join worker_position wp on w.id = wp.worker_id
left join worker_salary ws on w.id = ws.worker_id
left join s_alary s on ws.salary_id = s.id
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%Python%';

---17. ������� ����� � �������� Junior Python �������������
select w.name, p.position_name, s.sum_salary from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like 'Junior Python developer';

--- 18. ������� ����� � �������� Middle JS �������������
select w.name, s.sum_salary, p.position_name from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id 
left join p_osition p on wp.position_id = p.id
where p.position_name like 'Middle JavaScript developer';

--- 19. ������� ����� � �������� Senior Java �������������
select w.name, s.sum_salary, p.position_name from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join worker_salary ws on w.id = ws.worker_id 
left join s_alary s on ws.salary_id = s.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like 'Senior Java developer';

 ---20. ������� �������� Junior QA ���������
select s.sum_salary, p.position_name from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id
where p.position_name like 'Junior % QA engineer'


 ---21. ������� ������� �������� ���� Junior ������������
select avg(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id
where p.position_name like '%Junior%';

 ---22. ������� ����� ������� JS �������������
select sum(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%JavaScript developer';

 ---23. ������� ����������� �� QA ���������
select min(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%QA engineer';

 ---24. ������� ������������ �� QA ���������
select max(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%QA engineer';

---25. ������� ���������� QA ���������
select count(position_name) as Count_QA_engineer from p_osition
where position_name like '%QA engineer';

---26. ������� ���������� Middle ������������.
select count(position_name) as Count_Middle_Spec from p_osition 
where position_name like 'Middle%';

---27. ������� ���������� �������������
select count(position_name) as Count_Developer from p_osition 
where position_name like '%developer';

--- 28. ������� ���� (�����) �������� �������������.
select sum(sum_salary) from s_alary s
left join worker_salary ws on s.id = ws.salary_id 
left join workers w on w.id = ws.worker_id 
left join worker_position wp on wp.worker_id = w.id 
left join p_osition p on wp.position_id = p.id 
where p.position_name like '%developer';

--- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
select w.name, p.position_name, s.sum_salary from workers w 
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on p.id = wp.position_id 
left join worker_salary ws on ws.worker_id = w.id 
left join s_alary s on ws.salary_id = s.id
order by s.sum_salary;

--- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select w.name, p.position_name, s.sum_salary from workers w 
left join worker_position wp ON w.id = wp.worker_id 
left join p_osition p on p.id = wp.position_id 
left join worker_salary ws on ws.worker_id = w.id 
left join s_alary s  on ws.salary_id = s.id
where s.sum_salary >= 1700 and s.sum_salary <=2300
order by s.sum_salary;

---31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select w.name, p.position_name, s.sum_salary from workers w
left join worker_position wp on w.id = wp.worker_id 
left join p_osition p on p.id = wp.position_id 
left join worker_salary ws on ws.worker_id = w.id 
left join s_alary s on ws.salary_id = s.id 
where s.sum_salary < 2300
order by s.sum_salary;

--- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
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
--- ��� ���������� ������� �������� ��������� ��������:

---������ ������� workers
create table workers(
	id serial primary key, Name varchar(50)
);

---�������� �� �������
insert into workers(Name)
values(N'���������� ���� ���������'),
	(N'���������� ���� ���������'),
	(N'�������� ����������� ���������'),
	(N'���������� ���� ����������'),
	(N'������� ����� ���������'),
	(N'����� �������� ��������'),
	(N'������� ������ �����������'),
	(N'������� ����� �������'),
	(null),
	(N'������� ��������� ������'),
	(N'��������� ��������� ������'),
	(N'�������� ��������� ������'),
	(N'��������� ���������� �����������'),
	(N'������� ������� ����������'),
	(null),
	(N'������ ������ �������������'),
	(N'��������� ������ �����������'),
	(N'������ ������ ��������'),
	(null),
	(N'��������� ������ ���������'),
	(N'�������� ������ ������������'),
	(null),
	(N'������� ������ ����������'),
	(N'�������� ��������� �������'),
	(N'������� ������������� �������'),
	(N'�������� ������������� ��������'),
	(N'�������� ������������� ��������'),
	(N'����� ����� ���������'),
	(N'������� �������� ������������'),
	(null),
	(null),
	(N'������� ������ ����������'),
	(N'������ ��������� ����������'),
	(N'����� ������ ������������'),
	(N'�������� ������ ����������'),
	(null),
	(N'������ �������� ������������'),
	(null),
	(N'������ ���������� ������'),
	(N'��������� ������� ��������'),
	(N'������ ��������� ������'),
	(N'������ ���������� ���������'),
	(N'����� ����������� ������a'),
	(N'������� �������� ��������'),
	(N'������ ������� ��������'),
	(null),
	(N'����������� ������� ����������'),
	(N'�������� ���������� ������'),
	(N'������� ������ ���������'),
	(N'��������� ���������� ������'),
	(N'������� ����������� ������'),
	(N'���� ��������� �������'),
	(N'���� ��������� �������'),
	(N'�������� ������ �����������'),
	(N'����� ��������� ������'),
	(N'����� ������� ������������'),
	(N'��������� ������� ������'),
	(N'���������� ������������ ��������'),
	(N'������� ��������� �����'),
	(N'������� ������� ���������'),
	(N'��������� ������ ��������������'),
	(N'����� ���� ����������'),
	(N'��������� ���� �������'),
	(N'����� ����������� ������'),
	(N'���������� ������� ��������'),
	(N'�������� ������� �������������'),
	(N'������ ���������� ������'),
	(N'���� ������� �������'),
	(N'������ ������� ��������'),
	(N'��������� ��������� ����������'),
	(N'���� ������������� ��������'),
	(N'������ ����������� �������'),
	(N'���� Ը������� ���������'),
	(N'������� ���������� ������'),
	(N'���������� ��������� ���������'),
	(N'������ ������ ����������'),
	(N'�������� ����� ���������'),
	(N'��� ��������� �������'),
	(N'�������� ��������� ����������'),
	(N'�������� ����� ����������'),
	(null);
---������ ����������� ������� s_alary
create table s_alary(
id serial primary key,
sum_salary int
);

---�������� ������� s_alary
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

---������ ������� worker_salary
create table worker_salary(
id serial primary key,
worker_id int unique,
salary_id int,
foreign key (worker_id)
references workers(id),
foreign key (salary_id)
references s_alary(id)
);

---�������� ������� worker_salary
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

---������ ������� p_osition
create table p_osition(
	id serial primary key,
	position_name varchar(50)
);

---�������� ������� p_osition
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

---������ ����������� ������� worker_position
 create table worker_position(
id serial primary key,
worker_id int unique,
position_id int,
foreign key (worker_id)
references workers(id),
foreign key (position_id)
references p_osition(id)
);

---�������� ������� worker_position
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

