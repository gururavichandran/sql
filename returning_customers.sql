
-- create
CREATE TABLE transaction (
  transaction_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  item TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  revenue INTEGER NOT NULL
);

-- -- insert
INSERT INTO transaction VALUES (1000,101,'milk','2023-06-25 08:00:00',200);
INSERT INTO transaction VALUES (1010,101,'milk','2023-06-25 10:00:00',100);

INSERT INTO transaction VALUES (1011,102,'bread','2023-06-25 11:00:00',250);
INSERT INTO transaction VALUES (1100,102,'biscuit','2023-07-03 06:50:00',50);

INSERT INTO transaction VALUES (1015,103,'cards','2023-06-25 09:00:00',100);

INSERT INTO transaction VALUES (1017,104,'chocolate','2023-06-25 12:11:00',120);
INSERT INTO transaction VALUES (1289,104,'jam','2023-06-28 23:45:00',170);
INSERT INTO transaction VALUES (1341,104,'hat','2023-06-30 09:56:00',250);

INSERT INTO transaction VALUES (1020,105,'biscuit','2023-06-25 14:20:00',300);
INSERT INTO transaction VALUES (1562,105,'chocolate','2023-07-25 11:30:00',200);
INSERT INTO transaction VALUES (1866,105,'jam','2023-07-27 16:40:00',100);

INSERT INTO transaction VALUES (1051,106,'biscuit','2023-06-25 09:10:00',150);
INSERT INTO transaction VALUES (1071,106,'chocolate','2023-06-27 08:40:00',200);
INSERT INTO transaction VALUES (1086,106,'jam','2023-06-28 09:23:00',500);


select 
distinct
a.user_id 
from 
transaction a 
join 
transaction b
on a.user_id=b.user_id
and b.created_at>=a.created_at
and b.created_at<=DATE_ADD(a.created_at,INTERVAL 7 DAY)
and a.transaction_id!=b.transaction_id




