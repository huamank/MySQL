# 08 — Modelado de datos y constraints en SQL (MySQL)

## Objetivo
Comprender el uso de claves primarias y foráneas, restricciones (`NOT NULL`, `UNIQUE`, `CHECK`) y normalización básica para un buen diseño de base de datos.

---

## Clave primaria (PRIMARY KEY)
Identifica de forma única cada fila:
```sql
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL
);
```

## Clave foránea (FOREIGN KEY)
Define relaciones entre tablas:
```sql
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

## Constraints comunes
- **NOT NULL**: obliga a que la columna tenga valor.
- **UNIQUE**: asegura valores únicos en la columna.
- **CHECK**: valida condiciones específicas.
```sql
CHECK (list_price > 0)
```

## Índices
Mejoran la velocidad de búsqueda:
```sql
CREATE INDEX idx_orders_date ON orders(order_date);
```

---

## Normalización básica
- **1NF**: sin datos repetidos ni columnas multivalor.
- **2NF**: todas las columnas dependen de la clave primaria.
- **3NF**: no hay dependencias transitivas.

---

## Ejemplo práctico
```sql
CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(200) UNIQUE
);
```
