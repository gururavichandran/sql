
-- create
CREATE TABLE employee (
  empId INTEGER NOT NULL,
  action TEXT NOT NULL,
  time TIMESTAMP NOT NULL
);


-- insert
INSERT INTO employee VALUES (1,"in",'2023-06-25 08:00:00');
INSERT INTO employee VALUES (1,"out",'2023-06-25 08:30:00');
INSERT INTO employee VALUES (1,"in",'2023-06-25 09:00:00');
INSERT INTO employee VALUES (1,"out",'2023-06-25 10:00:00');
INSERT INTO employee VALUES (2,"in",'2023-06-25 11:00:00');
INSERT INTO employee VALUES (3,"out",'2023-06-25 13:00:00');
INSERT INTO employee VALUES (6,"in",'2023-06-25 11:05:00');
INSERT INTO employee VALUES (6,"out",'2023-06-25 15:00:00');
INSERT INTO employee VALUES (6,"in",'2023-06-25 15:05:00');

with in_time as
(
select 
empId,
max(time) as max_intime 
from employee
where action="in"
group by empId
),

out_time as
(
select 
empId,
max(time) as max_outtime 
from employee
where action="out"
group by empId
)

select
empId,
action,
time
from
(select 
a.empId,
action,
time,
max_intime,
max_outtime
from
employee a
left join 
in_time b
on a.empId=b.empId
-- using empId
left join 
out_time c
on a.empId=c.empId
) a 
where 
a.time=a.max_intime


