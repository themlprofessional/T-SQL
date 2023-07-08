-- Constraints - They ensure that data follows specific rules and only valid data is stored in the database

create table employees (
    employee_id int primary key,
    first_name nvarchar(50) not null,
    last_name nvarchar(50) not null,
    email nvarchar(100) unique,
    phone_number nvarchar(15),
    department_id int,
    salary decimal(10, 2) check(salary >= 0),
    hire_date date default getdate()
);

-------------------------------------------------------------------------------------------------------------------------------

-- 1) Primary key - It uniquely identifies each row in a table

create table employees (
    employee_id int primary key
);

-------------------------------------------------------------------------------------------------------------------------------

-- 2) Foreign key - It esatblishes relationship between two tables, 
-- ensuring that data in one table corresponds to data in another table

create table departments (
    department_id int primary key,
    department_name nvarchar(50) not null
);

alter table employees
add foreign key (department_id) references departments(department_id);

-------------------------------------------------------------------------------------------------------------------------------

-- 3) Unique constraint - It ensues that data in a column is unique across all rows

create table employees (
    email nvarchar(100) unique
)

-------------------------------------------------------------------------------------------------------------------------------

-- 4) Check constraint - It ensures that data in a column meets specific condition

create table employees (
    salary decimal(10, 2) check(salary >= 0)
);

-------------------------------------------------------------------------------------------------------------------------------

-- 5) Default constraint - It sets default value for a column when no value is specified during data insertion

create table employees (
    hire_date date default getdate()
);

-------------------------------------------------------------------------------------------------------------------------------

-- 6) Not NUll - It ensures that a column cannot have null value

create table employees (
    first_name nvarchar(50) not null,
    last_name nvarchar(50) not null
)

-------------------------------------------------------------------------------------------------------------------------------

-- Inserting sample data

insert into departments(department_id, department_name) values
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Marketing');

insert into employees(employee_id, first_name, last_name, email, phone_number, department_id, salary, hire_date) values
(1, 'John', 'Doe', 'John.Doe@example.com', '555-123-4567', 1, 60000.00, default);

select * from employees;

select * from departments;

-------------------------------------------------------------------------------------------------------------------------------