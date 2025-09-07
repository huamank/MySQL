# 04 — Agregaciones y GROUP BY (MySQL)

## Objetivo
Resumir datos con funciones agregadas (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), agrupar resultados con `GROUP BY` y filtrar grupos con `HAVING`.

---

## Funciones agregadas comunes
- `COUNT(*)`: cuenta filas (incluye NULLs).
- `COUNT(col)`: cuenta filas donde col no es NULL.
- `SUM(col)`: suma valores numéricos.
- `AVG(col)`: promedio.
- `MIN(col)`, `MAX(col)`: valores mínimo y máximo.

Ejemplo:
```sql
SELECT category_id, COUNT(*) AS total_productos
FROM products
GROUP BY category_id;
```

---

## WHERE vs HAVING
- `WHERE`: filtra filas **antes** de agrupar.
- `HAVING`: filtra **después** de agrupar.

Ejemplo:
```sql
SELECT category_id, COUNT(*) AS total
FROM products
WHERE active = 1
GROUP BY category_id
HAVING COUNT(*) > 10;
```

---

## Múltiples agregaciones
Puedes combinar varias en una misma consulta:
```sql
SELECT category_id,
       COUNT(*) AS total,
       AVG(list_price) AS promedio_precio,
       MIN(list_price) AS precio_min,
       MAX(list_price) AS precio_max
FROM products
GROUP BY category_id;
```

---

## Ordenar resultados
Puedes ordenar por alias:
```sql
ORDER BY total DESC;
```

---

## Errores comunes
- Incluir columnas en `SELECT` que no están en `GROUP BY` ni en una agregación → error.
- Filtrar con `WHERE` condiciones que dependen de agregados → usar `HAVING`.

---

## Ejemplos guiados
**Total de pedidos por estado:**
```sql
SELECT status, COUNT(*) AS total
FROM orders
GROUP BY status
ORDER BY total DESC;
```

**Clientes que han gastado más de 500:**
```sql
SELECT c.customer_id, c.first_name, SUM(p.amount) AS total_gastado
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.first_name
HAVING total_gastado > 500;
```
