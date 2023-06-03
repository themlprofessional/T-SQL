create table departments (
    department_id int primary key,
    department_name varchar(255) not null
);

insert into departments(department_id, department_name) values
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

create table employees (
    employee_id int primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    department_id int foreign key references departments(department_id),
    salary decimal(10, 2) not null
);

insert into employees(employee_id, first_name, last_name, department_id, salary) values
(1, 'John', 'Doe', 1, 60000),
(2, 'Jane', 'Doe', 1, 65000),
(3, 'Bob', 'Brown', 2, 70000),
(4, 'Alice', 'Johnson', 2, 75000),
(5, 'Charlie', 'Lee', 3, 80000);

-- 1) creating stored procedure
create procedure get_all_employees
as
begin
    select * from employees;
end;

-- 2) executing a stored procedure
exec get_all_employees;

-- 3) creating stored procedure with input parameters
create procedure get_employees_by_department
    @department_id int
as
begin
    select * from employees where department_id = @department_id;
end;

-- 4) executing a stored procedure with input parameters
exec get_employees_by_department @department_id = 2

-- 5) creating a stored procedure with output parameters
create procedure get_employee_count_by_department
    @department_id int,
    @employee_count int output
as
begin
    select @employee_count = count(*) from employees where department_id = @department_id;
end;

-- 6) executing a stored procedure with output parameters
declare @employee_count int;
exec get_employee_count_by_department @department_id = 2, @employee_count = @employee_count output;
select @employee_count as EmployeeCount;

-- 7) creating and using a stored procedure to modify data
create procedure update_employee_salary
    @employee_id int,
    @new_salary decimal(10, 2)
as
begin
    update employees set salary = @new_salary where employee_id = @employee_id;
end;

exec update_employee_salary @employee_id = 1, @new_salary = 65000;