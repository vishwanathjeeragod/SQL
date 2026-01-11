use company; 
create table employee3(
id int primary key,
name varchar(100),
email varchar(100),
gender ENUM('male','female','other'),
date_of_birth Date,
salary INT );

INSERT INTO employee3 
(id, name, email, gender, date_of_birth, salary)
VALUES
(1, 'Ravi Kumar', 'ravi.kumar@gmail.com', 'male', '1995-04-12', 45000),
(2, 'Ananya Sharma', 'ananya.sharma@gmail.com', 'female', '1998-09-25', 52000),
(3, 'Suresh Reddy', 'suresh.reddy@gmail.com', 'male', '1992-01-18', 60000),
(4, 'Meera Patel', 'meera.patel@gmail.com', 'female', '1997-06-30', 48000),
(5, 'Alex John', 'alex.john@gmail.com', 'other', '1994-11-05', 55000);
select * from employee;

select * from employee3;
-- UNION
select email,name from employee
UNION 
select email,name from employee3;






