-- Q01
-- CREATE TABLE suppliers (
--   supplier_id INT PRIMARY KEY,
--   name VARCHAR(150) NOT NULL,
--   email VARCHAR(200) UNIQUE
-- );

-- Q02
-- CREATE TABLE shipments (
--   shipment_id INT PRIMARY KEY,
--   order_id INT,
--   FOREIGN KEY (order_id) REFERENCES orders(order_id)
-- );

-- Q03
-- ALTER TABLE products
-- ADD CONSTRAINT chk_price_positive CHECK (list_price > 0);

-- Q04
-- CREATE INDEX idx_order_items_product_id ON order_items(product_id);
