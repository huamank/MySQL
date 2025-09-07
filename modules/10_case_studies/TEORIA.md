# 10 — Casos prácticos integradores (MySQL)

## Objetivo
Combinar JOINs, agregaciones, subconsultas, CTEs, funciones de ventana y optimización para resolver problemas reales.

---

## Enfoque recomendado
1. Identifica tablas y relaciones.
2. Define filtros de negocio (fechas, estados).
3. Construye un borrador simple (JOINs + filtros).
4. Agrega agregaciones/ventanas si aplica.
5. Optimiza (EXPLAIN, índices).

---

## Ejemplo
Top 5 clientes por gasto total en pedidos enviados en 2024:
```sql
WITH ventas_2024 AS (
  SELECT c.customer_id, c.first_name, c.last_name,
         SUM(p.amount) AS total_gastado,
         COUNT(DISTINCT o.order_id) AS num_pedidos
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN payments p ON o.order_id = p.order_id
  WHERE YEAR(o.order_date) = 2024 AND o.status = 'SHIPPED'
  GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM ventas_2024
ORDER BY total_gastado DESC
LIMIT 5;
```
