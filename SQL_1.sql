---вывести Id с сотрудников у которых имя начинается на букву "А"

Select Id from Contact
where name like N'A%';

---вывести Id с сотрудников у которых имя начинается на Букву от А до Я, 
   отосортировать поле Id по возростанию  

SELECT Id from Contact
where name like N'[А-Д]%'
order by Id;

---вывести Id, имя сотрудников кроме имени "Богдан"
   и отсортировать поле имя по убыванию

select Id, name from Contact
where name <> N'%Богдан'
order by 2 DESC;

---вывести Id, сотрудников с именем "Александр"

select Id, name from Contact
where name LIKE N'%Александр%';

---вывести сотрудников имена которых были соданы до 22.09.2021 15:43:35.641

select name, CreatedOn from Contact
where CreatedOn > '22.09.2021 15:43:35.641';

---вывестти все поля таблицы сотрудник

SELECT * from Contact;

---вывести получателя где продолжительность больше "14" из активностей
   и отсортировать поле получатель по возростанию

select Recepient,  DurationInMinutes from Activity
where DurationInMinutes > 14
order by 1;

---вывести получателя где продолжительность меньше "14" из активностей
   и отсортировать поле получатель по убыванию

SELECT Recepient from Activity
WHERE DurationInMinutes < 14
ORDER BY 1 DESC;

---вывести получателя где продолжительность равна "0" из активностей
   и отсортировать поле получатель по возростанию

select recepient from Activity
where DurationInMinutes = 0
order by 1;

---вывести продолжительность, получателей из активности

select DurationInMinutes, Recepient from Activity;

---вывести имена всех контактов "Александр" и дату их создания 29.09.2021

select name, CreatedOn from Contact
where name LIKE N'%Александр%' AND CreatedOn = '29.09.2021'

---вывести все поля из  таблицы проблемы

select * from Problem

---вывести все имена, из проблем где 
   TypeId будут заполнены, а ProcessListeners не будут равны "0"

select name from Problem 
where TypeId IS NULL and ProcessListeners <> 0
