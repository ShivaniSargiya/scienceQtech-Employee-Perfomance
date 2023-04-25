Select * from data_science_team;
Select EMP_ID, FIRST_NAME, GENDER, DEPT FROM emp_record_table;
# less than  2
Select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
from emp_record_table WHERE EMP_RATING < 2;
# Grater Than 4
Select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
from emp_record_table WHERE EMP_RATING > 4;

# between 2 and 4
Select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
from emp_record_table WHERE EMP_RATING BETWEEN 2 AND 4;

select CONCAT(FIRST_NAME, '', LAST_NAME) as NAME, 
DEPT from emp_record_table WHERE DEPT = 'FINANCE' ;

SELECT employee.EMP_ID, CONCAT(employee.FIRST_NAME,'',employee.LAST_NAME)
as employee_NAME, manager.MANAGER_ID, CONCAT(manager.FIRST_NAME,'',manager.LAST_NAME)
as Manager_Name, manager.ROLE as ROLE
FROM emp_record_table employee JOIN emp_record_table manager
ON employee.MANAGER_ID = manager.EMP_ID;

select EMP_ID, FIRST_NAME, LAST_NAME, DEPT AS Department 
from emp_record_table WHERE DEPT ='HEALTHCARE'
UNION 
select EMP_ID, FIRST_NAME, LAST_NAME, DEPT as Department 
from emp_record_table where DEPT ='FINANCE';

select ROLE,  MIN(SALARY) as min_sal, max(SALARY) as max_sal
from emp_record_table group by ROLE;

select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EXP, ROW_NUMBER() OVER (ORDER BY EXP DESC) 
from emp_record_table;

create VIEW employee_sall AS SELECT EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, SALARY
FROM emp_record_table where SALARY > 6000;

DELIMITER $$
CREATE FUNCTION employee_job_profile(EXP int) RETURNS VARCHAR (50)
deterministic
BEGIN 
DECLARE employee_job_profile varchar(50);
IF EXP <= 2 THEN SET employee_job_profile = 'JUNIOR DATA SCIENCTIST ';
elseif EXP between 2 AND 5 THEN SET employee_job_profile = 'ASSOCIATE DATA SCIENTIEST';
elseif EXP between 5 AND 10 THEN SET employee_job_profile = 'SENIOR DATA SCIENTIST';
elseif EXP between 10 AND 12 THEN SET employee_job_profile = 'LEAD DATA SCIENTIEST';
elseif EXP between 12 AND 16 THEN SET employee_job_profile = 'MANAGER';
END IF;
RETURN (employee_job_profile); end$$
select EMP_ID, FIRST_NAME, EXP, employee_job_profile(EXP) from emp_record_table;

DELIMETER $$
create procedure get_employee_exp()
begin
select * from emp_record_table where EXP > 3; END$$
call get_employee_exp();

CREATE INDEX idx_first_name ON emp_record_table(FIRST_NAME(255));
EXPLAIN SELECT EMP_ID, FIRST_NAME, LAST_NAME
FROM emp_record_table
where FIRST_NAME = 'Eric';

SELECT EMP_ID, FIRT_NAME, LAST_NAME, ROLE, DEPT, EXP,
SALARY, EMP_RATING, (0.05 * SALARY)*EXP_RATING AS BONUS
FROM emp_record_table;

select EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, CONTINENT, AVG(SALARY)
FROM emp_record_table
group by CONTINENT, COUNTRY;

