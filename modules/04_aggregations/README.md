# 04 – Agregaciones y GROUP BY (MySQL)

**Objetivos**
- Usar funciones agregadas (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).
- Agrupar resultados con `GROUP BY`.
- Filtrar grupos con `HAVING`.

**Tablas**: `products`, `categories`, `orders`, `order_items`, `customers`, `payments`.

## Ejercicios
- **Q01:** Muestra `category_id` y la cantidad total de productos (`COUNT(*)`) por categoría.
- **Q02:** Lista `status` y el número de pedidos por cada estado, ordenado de mayor a menor.
- **Q03:** Muestra `category_name` y el precio promedio (`AVG(list_price)`) de sus productos, solo para categorías con precio promedio > 100.
- **Q04:** Muestra `customer_id`, `first_name`, `last_name` y el total gastado (`SUM(amount)`) por cliente, ordenado del mayor al menor gasto.

Escribe tus consultas en `exercises.sql` debajo de cada marcador `-- Q0X`.

---

**Material de apoyo:** [TEORIA.md](./TEORIA.md) · [CHEATSHEET.md](./CHEATSHEET.md)
