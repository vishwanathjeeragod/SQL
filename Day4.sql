CREATE DATABASE university;
use university;

create table students2(sid int primary key,sname varchar(20)not null, phone varchar(20) unique, age int check (age>18));
insert into students2 values (1,'vishwa','5689143256',21),
(2,'ravi','9876543210',22),
(3,'suresh','9123456780',23),
(4,'mahesh','9988776655',24),
(5,'anil','9090909090',25),
(6,'kiran','9012345678',21),
(7,'rohit','9345678123',22),
(8,'manoj','8765432190',23),
(9,'arjun','8899776655',24),
(10,'vinay','9123987654',26),
(11,'deepak','9001122334',27),
(12,'prasad','9887766554',22),
(13,'naveen','9554433221',23),
(14,'santosh','9223344556',24),
(15,'lokesh','9332211445',25),
(16,'rahul','9445566778',21);

update students2 set sname='rahul' where phone='9001122334';
select * from students2;
  -- Readning the tables
select * from students2 where age>18;
select sname from students2 where age<25;
select * from students2 where age>25 and  sid<16;
select * from students2 where not age>25;

select * from students2;

select * from students2 where age>18 and age<24;
select * from students2 where age between 23 and 27;
select * from students2 where age=23 or age=26 or age=27;
select * from students2 where age in (23,25,27);
select * from students2 where sname like 'A%';  -- only 'A%' is used print the in which name has started as name A
select * from students2 where sname like '_A%';  -- this '_A%' is used to find second letter of the sname
select * from students2 where sname like '%A%';
select * from students2 where sname  not like  'A%' and  sname like '%h%';
select * from students2 where length(sname)>5;
select * from students2 where length(sname)<5;

-- limit offset ,count
select * from students2 where length(sname)>5 limit 4;
select * from students2 where length(sname)>5 limit 2,3;  -- it will give skip 2 rows and give next 3 rows of (sname)>5.
select * from students2 limit 1,3; 
 -- order by
select * from students2 where age>18 order by age DESC;
select * from students2 where age>20 order by age ASC;
select * from students2 order by  age;
   -- group by
select age,group_concat(sname),max(sname),min(sname), avg(phone), count(sid) from students2 group by age;
select age,group_concat(sname),max(sname),min(sname), avg(phone), count(sid)
from students2 where age>22 group by age having count(sid)>1 order by min(phone) desc limit 3;

select min(age)as Minimum_Age, max(age) as Maximum_Age, avg(age) Average_Age from students2;
select count(*) `number of rows` from students2;
-- retrive all the rows where age is above the average age - sub query
select *from students2 where age>(select avg(age) from students2 where sname like '%a');
use university;
  -- joins
  describe students2;
  create table hostel1(rid int, sid int, floor int);
  insert into hostel1 values(1,1,0),(2,2,0),(1,3,0),(2,4,0),(3,5,0),(3,6,0),(4,7,1),(4,8,1),
  (5,9,0),(5,10,1),(6,11,1),(6,12,1),(7,13,1),(7,14,1),(8,15,2),(8,16,2),(9,17,2),(9,18,2),(10,19,2),(10,20,2);
    -- USING LEFT JOIN
  select * from students2 left join hostel1 on students2.sid=hostel1.sid;
  select t1.sname,t2.rid from students2 t1 left join hostel1 t2 on t1.sid=t2.sid;
  
create table tab1 (col1 int, col2 varchar(10),col3 varchar(10));
insert into tab1 values (1,'Vishwa','Teaching'),(2,'Ram','Dancing'),(3,'Ravi','Ballet');
create table tab2(col4 int, col5 varchar(10),col6 int);
insert into tab2 values (1,'dancing',20),(2,'singing',30),(3,'Ballet',10);
select * from tab1 left join tab2 on tab1.col3=tab2.col5;

select * from tab1;
select * from tab2;
select tab1.col2 `name`,tab2.col5,tab1.col3, tab2.col6 `count` from tab1 right join tab2 on tab1.col3=tab2.col5;
select * from tab1 inner join tab2 on tab1.col3=tab2.col5;
select * from tab1 left join tab2 on tab1.col3=tab2.col5;

select * from tab1 left join tab2 on tab1.col3=tab2.col5
union
select * from tab1 left join tab2 on tab1.col3=tab2.col5;

select * from tab1 join tab2; -- cross join
 -- withdraw function
 select * from students2;
 
 
 -- row_number(),rank(), dense_mark()
 select *,row_number() over (order by  sname) from students2;
 select *,row_number() over (order by (select null)) index_col from students2;
 select *,rank() over (order by age) rank_col from students2;
 select *,dense_rank() over (order by age) rank_col from students2;
 select *,dense_rank() over (partition by age order by phone) trail_col from students2;
 
  -- USING SAVE POINT 
 create table table1 (col1 int, col2 varchar(3));
 savepoint s1;
 insert into table1 values (1,'ABC'),(2,'DEF');
 savepoint s2;
  insert into table1 values (3,'AfC'),(2,'fEF');
  savepoint s3;
  select * from table1;
  rollback to s2;
  commit;
  rollback to s1;

select * from table1;

-- order of execution in sql query
-- from/join -->where -->group by -->having--> select -->distinct --> order by --> limit(offset)
 select distinct age from students2;
 
 
 
 














