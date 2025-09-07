# 05 — Subconsultas y CTEs (MySQL)

## Objetivo
Utilizar subconsultas en distintas partes de la consulta (`WHERE`, `FROM`, `SELECT`) y aplicar CTEs (`WITH`) para hacer queries más legibles.

---

## Subconsultas en `WHERE`
Devuelven un valor o conjunto para filtrar:
```sql
SELECT product_id, product_name, list_price
FROM products
WHERE list_price = (SELECT MAX(list_price) FROM products);
```

---

## Subconsultas en `FROM`
Usadas como tablas derivadas:
```sql
SELECT category_id, promedio_precio
FROM (
  SELECT category_id, AVG(list_price) AS promedio_precio
  FROM products
  GROUP BY category_id
) AS sub
WHERE promedio_precio > 100;
```

---

## Subconsultas en `SELECT`
Ejecutadas por fila (cuidado con rendimiento):
```sql
SELECT p.product_id, p.product_name,
       (SELECT category_name
        FROM categories c
        WHERE c.category_id = p.category_id) AS categoria
FROM products p;
```

---

## CTEs (Common Table Expressions)
Definidas con `WITH`:
```sql
WITH ventas_por_cliente AS (
  SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_gastado
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN payments p ON o.order_id = p.order_id
  GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM ventas_por_cliente
WHERE total_gastado > 500;
```

**Ventajas:**
- Legibilidad y mantenimiento.
- Reutilización de lógicas intermedias.
- Encadenar múltiples CTEs.

---

## Errores comunes
- No dar alias a subconsultas en `FROM` → error de sintaxis.
- Usar subconsultas correlacionadas pesadas en grandes datasets.

---

## Ejemplos guiados
**Producto más caro:**
```sql
SELECT product_id, product_name, list_price
FROM products
WHERE list_price = (SELECT MAX(list_price) FROM products);
```

**Clientes con gasto > 500 usando CTE:**
```sql
WITH gasto_cliente AS (
  SELECT c.customer_id, c.first_name, SUM(p.amount) AS total
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN payments p ON o.order_id = p.order_id
  GROUP BY c.customer_id, c.first_name
)
SELECT *
FROM gasto_cliente
WHERE total > 500;
```
