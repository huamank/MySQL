CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(200) UNIQUE
);