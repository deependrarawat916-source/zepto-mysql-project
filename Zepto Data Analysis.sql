SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS zepto_db;
USE zepto_db;
SHOW TABLES;


CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    city VARCHAR(50),
    payment_mode VARCHAR(20),
    delivery_status VARCHAR(20),
    order_date DATE
);

/*Query1:Display all records*/
SELECT * FROM orders;

/*Query2:Show unique categories*/
SELECT DISTINCT category FROM orders;

/*Query3:Count total orders*/
SELECT COUNT(order_id) AS total_orders FROM orders;

/*Query4:Calculate total revenue*/
SELECT SUM(price * quantity) AS total_revenue
FROM orders;

/*Query5:Show delivered orders*/
SELECT *
FROM orders
WHERE delivery_status = 'Delivered';

/*Query6:Orders paid via UPI*/
SELECT *
FROM orders
WHERE payment_mode = 'UPI';


/*Query7:Orders from Delhi*/
SELECT *
FROM orders
WHERE city = 'Delhi';


/*Query8:Total sales by category*/
SELECT category, SUM(price * quantity) AS total_sales
FROM orders
GROUP BY category;


/*Query9:Top 5 expensive products*/
SELECT product_name, price
FROM orders
ORDER BY price DESC
LIMIT 5;


/*Query10:Total quantity sold per product*/
SELECT product_name, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_name;


/*Query11:Average order value*/
SELECT AVG(price * quantity) AS avg_order_value
FROM orders;


/*Query12:Orders in last 30 days*/
SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY;


/*Query13:Orders count per city*/
SELECT city, COUNT(order_id) AS total_orders
FROM orders
GROUP BY city;


/*Query14:Customers with more than one order*/
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


/*Query15:Revenue by payment mode*/
SELECT payment_mode, SUM(price * quantity) AS revenue
FROM orders
GROUP BY payment_mode;








