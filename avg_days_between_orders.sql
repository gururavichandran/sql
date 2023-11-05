DROP TABLE IF EXISTS orders_tbl;
create table orders_tbl
(
order_id varchar(500) primary key,
eater_id varchar(500) not null,
order_date varchar(500) NOT null
);

INSERT INTO orders_tbl (order_id, eater_id, order_date) values ('1', 'AB','2021-06-01');
INSERT INTO orders_tbl (order_id, eater_id, order_date) values ('2', 'AB','2021-06-01');
INSERT INTO orders_tbl (order_id, eater_id, order_date) values ('3', 'AB','2021-06-02');
INSERT INTO orders_tbl (order_id, eater_id, order_date) values ('4', 'AB','2021-06-03');
INSERT INTO orders_tbl (order_id, eater_id, order_date) values ('5', 'AB','2021-06-05');
INSERT INTO orders_tbl (order_id, eater_id, order_date) values ('6', 'CD','2021-06-01');
INSERT INTO orders_tbl (order_id, eater_id, order_date) values ('7', 'CD','2021-06-01');

select
eater_id,
SUM(DATEDIFF(order_date,prev_date))/count(*)
from
(select 
eater_id,
order_date,
lag(order_date) over (partition by eater_id) as prev_date
from
orders_tbl)a 
group by 1




select 
eater_id,
DATEDIFF(MAX(order_date),MIN(order_date))/count(*) as avg_days
from
orders_tbl
group by 1