use company;
select * from employee;
-- ADDING SEPARATE ROLES
select email,name, 'employee' as role from employee
UNION 
select email,name, 'employee3' as role  from employee3;
  
  -- USING ORDER BY WITH UNION
select email,name,date_of_birth, 'employee' as role from employee
UNION 
select email,name, date_of_birth,'employee3' as role  from employee3
ORDER BY date_of_birth;
  
  -- ALTER TABLE
  select * from employee3;
  alter table employee 
  add column referred_by_id int;

select * from employee;
    -- INSERT REFERAL DATA
-- update employee set referred_by_id= 1 where id in (2,3,12,14,15,16,17,18);
-- update employee set referred_by_id= 2 where id =4;



