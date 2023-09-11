-- 1. Найти сотрудников (имя, фамилия, номер телефона), чей номер содержит 45

SELECT 
	first_name,
	last_name,
	phone_NUMERIC
FROM Employees
WHERE phone_NUMERIC like "%45%";


-- 2. Найти сотрудников (имя, фамилия, зарплата), чья фамилия начинается на букву D и содержит букву A и зарабатывающие больше 5000

SELECT 
	first_name,
	last_name,
	salary
FROM Employees
WHERE last_name LIKE "D%A%" AND salary > 5000  ;


-- 3. Найти сотрудников (имя, фамилия, job_id, зарплата) с job_id IT_PROG, FI_ACCOUNT, ST_CLERK, зарабатывающих между 7000 и 12000 и чья фамилия содержит буквы A и O

SELECT 
	first_name,
	last_name,
    job_id,
	salary
FROM Employees
WHERE job_id IN ("IT_PROG, FI_ACCOUNT, ST_CLERK")
AND salary BETWEEN 7000 AND 1200 
AND (last_name LIKE "%A%" AND last_name LIKE "%O%");

-- 4. Вывести всех сотрудников (имя, фамилия, зп) отсортированными по зарплате в порядке возрастания
select
 first_name,
  last_name,
  salary
from employees
order by salary asc;


-- 5. Вывести всех сотрудников (имя, фамилия, зп) отсортированными по зарплате в порядке убывания
select
 first_name,
  last_name,
  salary
from employees
order by salary desc;

-- 6. Вывести всех сотрудников (имя, фамилия, зп) отсортированными по фамилии в алфавитном порядке
select
 first_name,
  last_name,
  salary
from employees
order by last_name;

-- 8. Вывести всех сотрудников (имя, фамилия, зп), зарабатывающих от 7 до 12 тыс, отсортированными по убыванию зарплаты. Если зп одинаковая, то отсортировать по фамилии в алфавитном порядке
select
 first_name,
  last_name,
  salary
from employees
where salary between 7000 and 12000
order by salary desc, last_name;

-- 1. Выведите коды всех рейсов, в рамках которых воздушные судна вылетели из Москвы и в данный момент находятся в воздухе (статус таких рейсов —  departed). Коды аэропортов Москвы: SVO, VKO, DME.
-- В выборке должен присутствовать один атрибут — trip_code.

SELECT 
	trip_code
FROM Trips 
WHERE departure IN ("SVO","VKO","DME")
AND status = "Departed";

-- 2. Выведите бортовые номера и дальность полета всех ближне- и дальнемагистральных самолетов. Примечание: ближнемагистральными считайте те, дальность полета которых > 1000 км и <= 2500 км. Дальнемагистральными — с дальностью полета >= 6000 км.
-- В выборке должны присутствовать два атрибута — side_number и range.

SELECT 
	side_number,
    range
FROM airliners
WHERE (range > 1000 AND range <= 2500)
OR range >= 6000;

-- 3. Выведите идентификаторы билетов бизнес-класса дешевле 15 000 и экономкласса дороже 65 000. Исключите из выборки билеты рейсов VR5SF5YIWN, OZAO28DLFP и LL4S1G8PQW, так как для них ценовая политика не меняется.
-- В выборке должен присутствовать один атрибут — id.

SELECT 
	id
FROM tickets
WHERE service_class = "Business" AND price < 65000
OR service_class = "Economy" AND price > 15000
AND trip_id NOT IN ("VR5SF5YIWN", "OZAO28DLFP","LL4S1G8PQW");

-- 4. Номера некоторых билетов рейса RL6EC4YWB1 внесены в базу некорректно: два последних символа билетов серии UE01H8UCJQXX введены неправильно. То есть на месте символов XX находятся некорректные значения. Номера некоторых билетов имеют значение NULL. Найдите идентификаторы пассажиров всех некорректно введенных билетов.
-- В выборке должен присутствовать один атрибут — client_id.

-- 4. Номера некоторых билетов рейса RL6EC4YWB1 внесены в базу некорректно: два последних символа билетов серии UE01H8UCJQXX введены неправильно. То есть на месте символов XX находятся некорректные значения. Номера некоторых билетов имеют значение NULL. Найдите идентификаторы пассажиров всех некорректно введенных билетов.
-- В выборке должен присутствовать один атрибут — client_id.

select
 client_id
from tickets
where trip_id = 'RL6EC4YWB1'
and id <> 'UE01H8UCJQXX'
and (id like 'UE01H8UCJQ__' or id is null);

-- 4. Отсортируйте данные о билетах в зависимости от цены по возрастанию. Если некоторые билеты имеют одинаковую цену, отсортируйте вхождения по trip_id по убыванию. Если и цена, и trip_id одинаковые, отсортируйте вхождения по номеру билета по возрастанию.
-- В выборке должны присутствовать три атрибута — id, trip_id, price.

SELECT 
	id,
    trip_id,
    price
FROM tickets
ORDER BY price, trip_id DESC, id;

-- 6. Определите имена и фамилии пассажиров, чьи идентификаторы заканчиваются на RCB или FCV, а номера телефонов не начинаются на +705.
-- В выборке должен присутствовать один атрибут — name.




-----------------------------------
------PRACTICE 07.09
---написать запрос, который выводит department_id в которых работают сотрудники. Значения повторяться не должны

SELECT DISTINCT 
 	department_id
FROM employees
WHERE department_id  IS NOT NULL

-- функция COALESCE заменяет значение NULL на любое дпугое 
SELECT 
	first_name,
	last_name,
	COALESCE(commision_pct,0) AS commision_pct
FROM employees 


--вывести записи, где название департамента состоит минимум из 2 слов

SELECT 
*
FROM departments
WHERE department_name 
LIKE "% %"
AND department_name  NOT LIKE "% % %"


--написать запрос, который выводит имя, фамилию и поле real_salary 
--real_salary - зарплата после вычета комиссии

SELECT 
	last_name,
    first_name,
    salary,
    salary *(1 - COALESCE(commission_pct,0)) AS real_salary 
FROM employees