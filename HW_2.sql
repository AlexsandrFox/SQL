--- ������� ������� employees. � ����������� : id, employee_Name.
create table employees(
	id serial primary key, employee_Name varchar(50) not null
);
 
---������� ������� salary. � ����������� : id, monthly_salary.
create table salary(
	id serial primary key,
	monthly_salary int not null
);

---������� ������� employee_salary. � ����������� : id, employee_id, salary_id.
create table employee_salary(
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null
);

---������� ������� roles. � ����������� : id, role_name.

create table roles(
	id serial primary key,
	role_name int unique not null
);

---��������� ������� employees 70 ��������.
insert into employees(employee_Name)
values(N'���������� ���� ���������'),
	(N'���������� ���� ���������'),
	(N'�������� ����������� ���������'),
	(N'���������� ���� ����������'),
	(N'������� ����� ���������'),
	(N'����� �������� ��������'),
	(N'������� ������ �����������'),
	(N'������� ����� �������'),
	(N'������� ��������� ������'),
	(N'��������� ��������� ������'),
	(N'�������� ��������� ������'),
	(N'��������� ���������� �����������'),
	(N'������� ������� ����������'),
	(N'������ ������ �������������'),
	(N'��������� ������ �����������'),
	(N'������ ������ ��������'),
	(N'��������� ������ ���������'),
	(N'�������� ������ ������������'),
	(N'������� ������ ����������'),
	(N'�������� ��������� �������'),
	(N'������� ������������� �������'),
	(N'�������� ������������� ��������'),
	(N'�������� ������������� ��������'),
	(N'����� ����� ���������'),
	(N'������� �������� ������������'),
	(N'������� ������ ����������'),
	(N'������ ��������� ����������'),
	(N'����� ������ ������������'),
	(N'�������� ������ ����������'),
	(N'������ �������� ������������'),
	(N'������ ���������� ������'),
	(N'��������� ������� ��������'),
	(N'������ ��������� ������'),
	(N'������ ���������� ���������'),
	(N'����� ����������� ������a'),
	(N'������� �������� ��������'),
	(N'������ ������� ��������'),
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
	(N'�������� ����� ����������');

---��������� ������� salary 15 ��������.
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

---��������� ������� employee_salary 40 ��������:
---� 10 ����� �� 40 �������� �������������� employee_id.

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

---�������� ��� ������ role_name � int �� varchar(30).
alter table roles
alter column role_name type varchar(30) using role_name::varchar(30);

---��������� ������� roles 20 ��������.

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

---������� ������� roles_employee. 
---- id. Serial  primary key,
--- employee_id. Int, not null, unique (������� ���� ��� ������� employees, ���� id)
--- role_id. Int, not null (������� ���� ��� ������� roles, ���� id).

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id  int not null,
	foreign key (employee_id)
	references employees(id),
	foreign key (role_id)
	references roles(id)
);

---��������� ������� roles_employee 40 ��������.
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

select * from roles_employee;



