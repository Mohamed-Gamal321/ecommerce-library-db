/* Create Database and Tables for ecommerce */

CREATE DATABASE ecommerce;
USE ecommerce;


CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  fullname VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(15),
  address_id INT,
  FOREIGN KEY (address_id) REFERENCES address(address_id)
);


CREATE TABLE address (
  address_id INT PRIMARY KEY AUTO_INCREMENT,
  post VARCHAR(10),
  country VARCHAR(50) NOT NULL,
  county VARCHAR(50),
  city VARCHAR(50) NOT NULL,
  street VARCHAR(100)
);


CREATE TABLE payment_method (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL
);


CREATE TABLE category (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL
);


CREATE TABLE product (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
  category_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);


CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  payment_id INT NOT NULL,
  status VARCHAR(50) NOT NULL,
  date DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (payment_id) REFERENCES payment_method(payment_id)
);


CREATE TABLE order_product (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL CHECK (quantity > 0),
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);
  

-- إدخال بيانات جدول العناوين (address)
INSERT INTO address (post, country, county, city, street) VALUES
('12345', 'Egypt', 'Cairo', 'Cairo', '123 Nile St'),
('67890', 'Egypt', 'Giza', 'Giza', '456 Pyramids Rd'),
('11223', 'USA', 'California', 'LA', '789 Sunset Blvd'),
('44556', 'UK', 'London', 'London', '101 Baker St'),
('78901', 'Canada', 'Toronto', 'Toronto', '202 Queen St'),
('33445', 'Australia', 'Sydney', 'Sydney', '12 Harbour St'),
('55678', 'Germany', 'Berlin', 'Berlin', '88 Brandenburg St'),
('99887', 'France', 'Paris', 'Paris', '5 Champs Elysees'),
('22334', 'Japan', 'Tokyo', 'Tokyo', '10 Sakura St'),
('66778', 'Brazil', 'Sao Paulo', 'Sao Paulo', '99 Paulista Ave');

-- إدخال بيانات جدول المستخدمين (users)
INSERT INTO users (username, password, fullname, email, phone, address_id) VALUES
('user1', 'pass123', 'John Doe', 'john@example.com', '1234567890', 1),
('user2', 'pass456', 'Jane Smith', 'jane@example.com', '0987654321', 2),
('user3', 'pass789', 'Mike Tyson', 'mike@example.com', '1122334455', 3),
('user4', 'pass321', 'Sara Connor', 'sara@example.com', '5566778899', 4),
('user5', 'pass654', 'Chris Evans', 'chris@example.com', '9988776655', 5),
('user6', 'pass987', 'Emily Clark', 'emily@example.com', '6677889900', 6),
('user7', 'pass111', 'David Brown', 'david@example.com', '4455667788', 7),
('user8', 'pass222', 'Anna White', 'anna@example.com', '3344556677', 8),
('user9', 'pass333', 'James Green', 'james@example.com', '2233445566', 9),
('user10', 'pass444', 'Laura Black', 'laura@example.com', '1122334455', 10);

-- إدخال بيانات طرق الدفع (payment_method)
INSERT INTO payment_method (title) VALUES
('Credit Card'),
('PayPal'),
('Cash on Delivery'),
('Bank Transfer'),
('Bitcoin'),
('Apple Pay'),
('Google Pay'),
('Gift Card'),
('Cheque'),
('Mobile Payment');

-- إدخال بيانات الفئات (category)
INSERT INTO category (title) VALUES
('Books'),
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Sports'),
('Toys'),
('Beauty'),
('Automotive'),
('Music'),
('Office Supplies');

-- إدخال بيانات المنتجات (product)
INSERT INTO product (title, description, price, category_id) VALUES
('Book 1', 'A great book about programming.', 50.00, 1),
('Book 2', 'Learn SQL easily.', 40.00, 1),
('Smartphone', 'Latest model smartphone.', 600.00, 2),
('T-Shirt', 'Comfortable cotton t-shirt.', 20.00, 3),
('Coffee Maker', 'Brew coffee at home.', 80.00, 4),
('Basketball', 'Official size basketball.', 30.00, 5),
('Toy Car', 'Remote controlled car.', 45.00, 6),
('Lipstick', 'Long-lasting lipstick.', 15.00, 7),
('Car Vacuum', 'Vacuum cleaner for cars.', 70.00, 8),
('Office Chair', 'Ergonomic office chair.', 150.00, 10);

-- إدخال بيانات الطلبات (orders)
INSERT INTO orders (user_id, payment_id, status, total_amount, date) VALUES
(1, 1, 'Completed', 90.00, '2025-05-16 14:30:00'),
(2, 2, 'Pending', 600.00, '2025-05-16 15:00:00'),
(3, 3, 'Shipped', 20.00, '2025-05-16 16:00:00'),
(4, 4, 'Completed', 230.00, '2025-05-17 10:00:00'),
(5, 5, 'Cancelled', 45.00, '2025-05-17 12:00:00'),
(6, 6, 'Pending', 15.00, '2025-05-18 09:00:00'),
(7, 7, 'Completed', 70.00, '2025-05-18 11:00:00'),
(8, 8, 'Shipped', 150.00, '2025-05-19 13:00:00'),
(9, 9, 'Pending', 40.00, '2025-05-19 15:00:00'),
(10, 10, 'Completed', 80.00, '2025-05-20 08:00:00');

-- إدخال بيانات منتجات الطلبات (order_product)
INSERT INTO order_product (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 7, 1),
(6, 8, 1),
(7, 9, 1),
(8, 10, 1),
(9, 2, 1),
(10, 5, 1);

mysql> SELECT * FROM users
    -> WHERE fullname LIKE '%John%';
+---------+----------+----------+----------+------------------+------------+------------+
| user_id | username | password | fullname | email            | phone      | address_id |
+---------+----------+----------+----------+------------------+------------+------------+
|       1 | user1    | pass123  | John Doe | john@example.com | 1234567890 |          1 |
+---------+----------+----------+----------+------------------+------------+------------+
1 row in set (0.016 sec)


mysql> SELECT * FROM orders
    -> WHERE status = 'Completed';
+----------+---------+------------+-----------+---------------------+
| order_id | user_id | payment_id | status    | date                |
+----------+---------+------------+-----------+---------------------+
|        1 |       1 |          1 | Completed | 2025-05-16 14:30:00 |
|        4 |       4 |          4 | Completed | 2025-05-17 10:00:00 |
|        7 |       7 |          7 | Completed | 2025-05-18 11:00:00 |
|       10 |      10 |         10 | Completed | 2025-05-20 08:00:00 |
+----------+---------+------------+-----------+---------------------+
4 rows in set (0.012 sec)

mysql> SELECT user_id, COUNT(order_id) AS total_orders
    -> FROM orders
    -> GROUP BY user_id;
+---------+--------------+
| user_id | total_orders |
+---------+--------------+
|       1 |            1 |
|       2 |            1 |
|       3 |            1 |
|       4 |            1 |
|       5 |            1 |
|       6 |            1 |
|       7 |            1 |
|       8 |            1 |
|       9 |            1 |
|      10 |            1 |
+---------+--------------+
10 rows in set (0.008 sec)



mysql> SELECT * FROM product
    -> WHERE price > 100;
+------------+---------------+----------------------------+---------+-------------+
| product_id | title         | description                | price   | category_id |
+------------+---------------+----------------------------+---------+-------------+
|          1 | Laptop        | High-performance laptop    | 1200.00 |           1 |
|          2 | Smartphone    | Latest model smartphone    |  800.00 |           1 |
|          5 | Tennis Racket | Professional tennis racket |  150.00 |           4 |
|          8 | Sofa          | Comfortable 3-seater sofa  |  500.00 |           7 |
+------------+---------------+----------------------------+---------+-------------+
4 rows in set (0.012 sec)


mysql> SELECT * FROM product
    -> WHERE title LIKE '%Book%';
+------------+------------+--------------------+-------+-------------+
| product_id | title      | description        | price | category_id |
+------------+------------+--------------------+-------+-------------+
|          3 | Novel Book | Best-selling novel | 20.00 |           2 |
+------------+------------+--------------------+-------+-------------+
1 row in set (0.011 sec)


mysql> SELECT order_id, SUM(quantity * price) AS total_order_value
    -> FROM order_product op
    -> JOIN product p ON op.product_id = p.product_id
    -> GROUP BY order_id;
+----------+-------------------+
| order_id | total_order_value |
+----------+-------------------+
|        1 |           3200.00 |
|        2 |            170.00 |
|        3 |             95.00 |
|        4 |             70.00 |
|        5 |            500.00 |
|        6 |            100.00 |
|        7 |             40.00 |
+----------+-------------------+
7 rows in set (0.014 sec)
