


USE university;
CREATE TABLE students(
id int primary key,
name varchar(20)not null,
email varchar(30)unique,
phone_number varchar(10) unique default'0000000000',
joining_date date,
age int check(age>18));     
   
         -- inserting values
-- Insert into students values(4,'riyaz','riyaz@gmail.com','6594594678','2025-11-12',20);
-- select*from students;
-- insert into students values()


        -- Adding new column
Alter table students add column branch varchar(3)default 'AAA';
        -- rename column
Alter table students rename column branch to course;


select*from students;
select*from students limit 1,2;
update students set name='ram'where id=2;
select*from students where age<=30;
select*from students where age between 20 and 30;