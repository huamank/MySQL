CREATE INDEX idx_orders_customer ON orders(customer_id);
EXPLAIN SELECT * FROM orders WHERE customer_id = 10;