create table students (
    student_id int primary key,
    first_name nvarchar(50),
    last_name nvarchar(50),
    age int,
    grade float
)

insert into students(student_id, first_name, last_name, age, grade) values
(1, 'John', 'Doe', 21, 85.5),
(2, 'Jane', 'Doe', 24, 90),
(3, 'Alice', 'Johnson', 23, 75),
(4, 'Bob', 'Williams', 24, 88),
(5, 'Charlie', 'Brown', 20, 70);

-------------------------------------------------------------------------------------------------------------------------------

-- 1) simple if else statement

declare @student_grade float;

set @student_grade = 80.0;

if @student_grade > 80
    print 'Pass';
else
    print 'Fail';

-------------------------------------------------------------------------------------------------------------------------------

-- 2) nested if else statement

declare student_id int;

set @student_id = 5;

if @student_id = 1
    print 'Student is John';
else
    if @student_id = 2
        print 'Student is Jane';
    else
        if @student_id = 3
            print 'Student is Alice Johnson';
        else
            if @student_id = 4
                print 'Student is Bob Williams';
            else
                if @student_id = 5
                    print 'Student is Charlie Brown';
                else
                    print 'Student not found';

-------------------------------------------------------------------------------------------------------------------------------

-- 3) if else statement with select statement

declare @age_threshold int;

set @age_threshold = 22;

if @age_threshold <= 22
    select * from students where age <= 22;
else
    select * from students where age > 22;

-------------------------------------------------------------------------------------------------------------------------------