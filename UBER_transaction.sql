create database uber 
use uber
CREATE TABLE transactions (
  user_id INT,
  spend DECIMAL(10,2),
  transaction_date DATETIME
);


INSERT INTO transactions (user_id, spend, transaction_date)
VALUES
  (111, 100.50, '2022-01-08 12:00:00'),
  (111, 55, '2022-01-10 12:00:00'),
  (121, 36, '2022-01-18 12:00:00'),
  (145, 24.99, '2022-01-26 12:00:00'),
  (111, 89.60, '2022-02-05 12:00:00'); 
  select * from transactions
select user_id,spend,transaction_date from
(
  select * ,row_number() over (partition by user_id order by   transaction_date  ) as trans_num
  from  transactions) as x where trans_num=3