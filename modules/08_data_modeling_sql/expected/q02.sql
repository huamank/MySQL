CREATE TABLE shipments (
  shipment_id INT PRIMARY KEY,
  order_id INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);