USE hw_2;

/* Задача 1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными.
*/
CREATE TABLE sales(
	id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    bucket INT
   
);
-- В самой задаче не понятны значения корзины (bucket), как я понял значения корзины нужно подставить самому
INSERT INTO sales (order_date, bucket)
VALUES 
('2021-01-01', 101),
('2021-01-02', 105),
('2021-01-03', 98),
('2021-01-04', 250),
('2021-01-05', 350);

SELECT * FROM sales;

SELECT id, bucket,
CASE 
	WHEN bucket < 100 THEN 'Маленький заказ'
    WHEN bucket BETWEEN 100 AND 300 THEN 'Средний заказ'
    WHEN bucket > 300 THEN 'Большой заказ'
END AS 'Вид заказа'
FROM sales;

-- Задача 3 

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
    employeeid VARCHAR(50) NOT NULL,
    amount DECIMAL(5,2),
    order_status VARCHAR(50) NOT NULL
);
INSERT INTO orders (employeeid, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED'),
('e04', 99.99, 'OPEN');

SELECT * FROM orders;

SELECT order_id, order_status,
CASE order_status
	WHEN 'OPEN' THEN 'Order is in open state'
    WHEN 'CLOSED' THEN 'Order is closed'
    WHEN 'CANCELLED' THEN 'Order is cancelled'
END AS 'order_summary'
FROM orders;
