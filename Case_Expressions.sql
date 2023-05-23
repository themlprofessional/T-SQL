create table students (
    student_id int primary key,
    first_name nvarchar(255),
    last_name nvarchar(255),
    age int,
    grade char(1)
);

insert into students(student_id, first_name, last_name, age, grade)
values (1, 'Alice', 'Brown', 17, 'A'),
(2, 'Bob', 'Smith', 18, 'B'),
(3, 'Carol', 'Johnson', 19, 'C'),
(4, 'David', 'Williams', 20, 'A'),
(5, 'Eve', 'Jones', 18, 'B');

-- simple case expression
select first_name, last_name, grade,
    case grade
        when 'A' then 'Excellent'
        when 'B' then 'Good'
        when 'C' then 'Average'
        else 'Unknown'
    end as GradeDescription
from students;

-- searched case expression
select first_name, last_name, age,
    case
        when age between 10 and 14 then 'Junior High'
        when age between 15 and 18 then 'Senior High'
        when age > 18 then 'College'
        else 'Unknown'
    end as education_level
from students;

-- multiple case expression
select first_name, last_name, age, grade,
    case
        when age < 18 then 'minor'
        else 'major'
    end as age_category,
    case grade
        when 'A' then 'Excellent'
        when 'B' then 'Good'
        when 'C' then 'Average'
        else 'Unknown'
    end as grade_description
from students;