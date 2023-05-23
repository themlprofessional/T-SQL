create table employees (
  employee_id int primary key,
  first_name nvarchar(50),
  last_name nvarchar(50),
  age int null,
  phone_number nvarchar(15) null
  );

insert into employees(employee_id, first_name, last_name, age, phone_number)
values (1, 'John', 'Doe', 30, '555-123-4567'),
(2, 'Jane', 'Doe', 28, null),
(3, 'Jim', 'Smith', null, '555-987-6543');

select * from employees;

-------------------------------------------------------------------------------------------------------------------------------

-- 1) Update null values with default values

-- setting a default value for null age values
update employees
set age = 0
where age is null;

-- setting a default value for null phone_number values
update employees
set phone_number = 'N/A'
where phone_number is null;

select * from employees;

drop table employees;

-------------------------------------------------------------------------------------------------------------------------------

-- 2) drop rows containing null values

-- delete rows with a null value in the age column
delete from employees
where age is null;

-- delete rows with a null value in the phone_number column
delete from employees
where phone_number is null;

drop table employees;

-------------------------------------------------------------------------------------------------------------------------------

-- 3) select rows without null values

select employee_id, first_name, last_name, phone_number
from employees
where age is not null and phone_number is not null;

-------------------------------------------------------------------------------------------------------------------------------
