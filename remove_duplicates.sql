
-- create
CREATE TABLE employee (
  empId INTEGER,
  employeeName TEXT NOT NULL,
  empSalary INTEGER NOT NULL,
  deptId INTEGER NOT NULL,
  managerId INTEGER NOT NULL
);


-- insert
INSERT INTO employee VALUES (100,"ajay",15000,201,301);
INSERT INTO employee VALUES (101,"yadav",170000,201,301);
INSERT INTO employee VALUES (101,"yadav",70000,205,305);
INSERT INTO employee VALUES (102,"rahul",25000,203,303);
INSERT INTO employee VALUES (102,"rahul",250000,201,301);
INSERT INTO employee VALUES (103,"raghav",55000,201,301);
INSERT INTO employee VALUES (104,"arjun",76000,206,301);
INSERT INTO employee VALUES (105,"raja",95000,209,301);

-- Group by
select 
employeeName,
count(*)
from 
employee 
group by 1
having count(*)=1

-- Row number
select
*
from
(
select 
*,
row_number() over (partition by empId order by empSalary desc) as rn
from employee
) a 
where a.rn=1








