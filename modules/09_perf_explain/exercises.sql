-- Q01
-- EXPLAIN SELECT * FROM orders WHERE customer_id = 10;

-- Q02
-- CREATE INDEX idx_orders_customer ON orders(customer_id);
-- EXPLAIN SELECT * FROM orders WHERE customer_id = 10;

-- Q03
-- EXPLAIN SELECT o.order_id, c.first_name, p.product_name
-- FROM orders o
-- JOIN customers c ON o.customer_id = c.customer_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- JOIN products p ON oi.product_id = p.product_id;

-- Q04
-- -- Mejora propuesta: agregar índice en order_items(product_id) y filtrar por condiciones relevantes.
