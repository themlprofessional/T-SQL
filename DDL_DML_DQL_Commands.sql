-- Data Definition Language (DDL) - It us used to define and manage the database structure.

-- 1) Create Table
create table employees (
    employee_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    birth_date date,
    hire_date date
)

-- 2) Alter Table
alter table employees
add email varchar(100);

-- 3) Drop Table
drop table employees;

-------------------------------------------------------------------------------------------------------------------------------

-- Data Manipulation Language (DML) - It is used to insert, update and delete data in the database

-- 1) Insert
insert into employees(employee_id, first_name, last_name, birth_date, hire_date, email) values
(1, 'John', 'Doe', '1988-06-10', '2023-06-11', 'John.Doe@example.com');

-- 2) Update
update employees
set email = 'John.Doe@gmail.com'
where employee_id = 1;

-- 3) Delete
delete from employees
where employee_id = 1;

-------------------------------------------------------------------------------------------------------------------------------

-- Data Control Language (DCL) - It is used to manage user access and permissions in the database

-- 1) Grant
grant select, insert, update, delete on employees to dbo;

-- 2) Revoke
revoke delete on employees from dbo;

-------------------------------------------------------------------------------------------------------------------------------

-- Data Query Language (DQL) - It is used to query and retrive data from database

-- 1) Select
select first_name, last_name, birth_date, hire_date, email
from employees
where hire_date >= '1977-01-01';

-------------------------------------------------------------------------------------------------------------------------------

-- Transaction Control Language (TCL) - It is used to manage transactions in the database ensuring data consistency and integrity.

-- 1) Begin Transaction - Starts a new transaction
begin transaction;

-- 2) Savepoint - Creates a savepoint within the application, to which we can rollback
save transaction my_savepoint;

-- 3) Rollback - Rolls back the transaction to a specific savepoint
rollback transaction my_savepoint;

-- 4) Commit - It saves the changes made during the transaction to the database
commit transaction;

-- example
begin transaction;
insert into employees(employee_id, first_name, last_name, birth_date, hire_date) values
(2, 'Jane', 'Smith', '1993-03-15', '2021-03-01');
save transaction my_savepoint;
update employees set hire_date = '2021-04-01' where employee_id = 1;
rollback transaction my_savepoint;
commit transaction;

-------------------------------------------------------------------------------------------------------------------------------

-- creating a login
create login my_login_name with password = 'my_password';

-- creating a user for login
create user my_user for login my_login;

-- checking the current database name
select db_name() as current_database;
-- checking the current user name
select current_user as current_user_name;

-- creating the database
create database my_database;
use my_database;

-- 1) Grant
grant select, insert, update, delete on my_table_name to my_user_name;

-- 2) Revoke
revoke delete on employees from my_database

-------------------------------------------------------------------------------------------------------------------------------