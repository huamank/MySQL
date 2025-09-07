-- MySQL build script for Hazlo con Datos SQL path
-- Usage (local): mysql --local-infile=1 -u <user> -p < setup/build_db_mysql.sql
-- Or: mysql --local-infile=1 -u <user> -p hazlocondatos_sql < setup/build_db_mysql.sql

DROP DATABASE IF EXISTS hazlocondatos_sql;
CREATE DATABASE hazlocondatos_sql CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE hazlocondatos_sql;

-- TIENDA
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  category_id INT NOT NULL,
  product_name VARCHAR(200) NOT NULL,
  list_price DECIMAL(10,2) NOT NULL,
  cost DECIMAL(10,2) NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATE NOT NULL,
  CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(200) NOT NULL,
  city VARCHAR(100) NOT NULL,
  signup_date DATE NOT NULL
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  status ENUM('PENDING','PAID','SHIPPED','CANCELLED') NOT NULL,
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
  order_id INT PRIMARY KEY,
  payment_method ENUM('CARD','CASH','TRANSFER','WALLET') NOT NULL,
  amount DECIMAL(12,2) NOT NULL,
  payment_date DATE NOT NULL,
  payment_status ENUM('SUCCESS','PENDING','REFUND') NOT NULL,
  CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

SET SESSION sql_mode = REPLACE(@@sql_mode,'NO_ZERO_DATE','');
SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE 'datasets/tienda/categories.csv'
INTO TABLE categories
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(category_id,category_name);

LOAD DATA LOCAL INFILE 'datasets/tienda/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(product_id,category_id,product_name,list_price,cost,active,created_at);

LOAD DATA LOCAL INFILE 'datasets/tienda/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(customer_id,first_name,last_name,email,city,signup_date);

LOAD DATA LOCAL INFILE 'datasets/tienda/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(order_id,customer_id,order_date,status);

LOAD DATA LOCAL INFILE 'datasets/tienda/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(order_item_id,order_id,product_id,quantity,unit_price);

LOAD DATA LOCAL INFILE 'datasets/tienda/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(order_id,payment_method,amount,payment_date,payment_status);

-- STREAMING
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  user_id INT PRIMARY KEY,
  full_name VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  city VARCHAR(100) NOT NULL,
  signup_date DATE NOT NULL
);

DROP TABLE IF EXISTS subscriptions;
CREATE TABLE subscriptions (
  subscription_id INT PRIMARY KEY,
  user_id INT NOT NULL,
  plan ENUM('FREE','BASIC','STANDARD','PREMIUM') NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  CONSTRAINT fk_sub_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

DROP TABLE IF EXISTS content;
CREATE TABLE content (
  content_id INT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  genre VARCHAR(100) NOT NULL,
  minutes INT NOT NULL
);

DROP TABLE IF EXISTS views;
CREATE TABLE views (
  view_id INT PRIMARY KEY,
  user_id INT NOT NULL,
  content_id INT NOT NULL,
  view_date DATE NOT NULL,
  minutes_watched INT NOT NULL,
  CONSTRAINT fk_views_user FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT fk_views_content FOREIGN KEY (content_id) REFERENCES content(content_id)
);

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (
  rating_id INT PRIMARY KEY,
  user_id INT NOT NULL,
  content_id INT NOT NULL,
  rating INT NOT NULL,
  rating_date DATE NOT NULL,
  CONSTRAINT fk_ratings_user FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT fk_ratings_content FOREIGN KEY (content_id) REFERENCES content(content_id)
);

LOAD DATA LOCAL INFILE 'datasets/streaming/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(user_id,full_name,email,city,signup_date);

LOAD DATA LOCAL INFILE 'datasets/streaming/subscriptions.csv'
INTO TABLE subscriptions
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(subscription_id,user_id,plan,start_date,end_date);

LOAD DATA LOCAL INFILE 'datasets/streaming/content.csv'
INTO TABLE content
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(content_id,title,genre,minutes);

LOAD DATA LOCAL INFILE 'datasets/streaming/views.csv'
INTO TABLE views
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(view_id,user_id,content_id,view_date,minutes_watched);

LOAD DATA LOCAL INFILE 'datasets/streaming/ratings.csv'
INTO TABLE ratings
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(rating_id,user_id,content_id,rating,rating_date);
