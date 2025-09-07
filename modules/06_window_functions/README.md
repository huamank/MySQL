# 06 – Window Functions (MySQL)

**Objetivos**
- Usar funciones de ventana (`ROW_NUMBER`, `RANK`, `LAG`, `LEAD`).
- Calcular agregados sin colapsar filas.
- Comparar diferencias con `GROUP BY`.

**Tablas**: `products`, `categories`, `orders`, `order_items`.

## Ejercicios
- **Q01:** Muestra `product_id`, `product_name`, `category_id` y la posición de precio dentro de su categoría usando `ROW_NUMBER` (ordenado por `list_price` descendente).
- **Q02:** Lista `order_id`, `customer_id`, `order_date` y la posición de cada pedido de un cliente usando `RANK` (ordenado por fecha ascendente).
- **Q03:** Muestra `product_id`, `product_name`, `list_price` y el precio del producto anterior en la misma categoría usando `LAG`.
- **Q04:** Muestra `category_id`, `product_id`, `list_price` y el precio promedio de su categoría usando `AVG` con ventana.

Escribe tus consultas en `exercises.sql` debajo de cada marcador `-- Q0X`.

---

**Material de apoyo:** [TEORIA.md](./TEORIA.md) · [CHEATSHEET.md](./CHEATSHEET.md)
