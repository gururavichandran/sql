
-- create
CREATE TABLE student (
  studId INTEGER NOT NULL,
  subject TEXT NOT NULL,
  marks INTEGER NOT NULL
);


-- insert
INSERT INTO student VALUES (1001,"English",78);
INSERT INTO student VALUES (1001,"Maths",80);
INSERT INTO student VALUES (1001,"Science",95);


INSERT INTO student VALUES (1002,"English",83);
INSERT INTO student VALUES (1002,"Maths",82);
INSERT INTO student VALUES (1002,"Science",65);

select 
studId,
sum(case when subject="English" then marks else 0 end) as English,
sum(case when subject="Maths" then marks else 0 end) as Maths,
sum(case when subject="Science" then marks else 0 end) as Science
from 
student
group by studId



