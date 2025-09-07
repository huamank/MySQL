# 03 – JOINs básicos (MySQL)

**Objetivos**
- Combinar tablas con `INNER JOIN` y `LEFT JOIN`.
- Utilizar alias para mayor claridad.
- Entender relaciones 1‑N y N‑N en SQL.

**Tablas**: `products`, `categories`, `orders`, `customers`, `order_items`.

## Ejercicios
- **Q01:** Muestra `product_id`, `product_name` y `category_name` de todos los productos usando `INNER JOIN`.
- **Q02:** Lista `order_id`, `order_date`, `first_name`, `last_name` de todos los pedidos junto al nombre del cliente (`INNER JOIN`).
- **Q03:** Muestra `customer_id`, `first_name`, `last_name` y el `order_id` de todos los clientes, incluyendo aquellos sin pedidos (`LEFT JOIN`).
- **Q04:** Lista `order_id`, `product_name` y `quantity` de cada producto en cada pedido (`JOIN` múltiple entre `orders`, `order_items` y `products`).

Escribe tus consultas en `exercises.sql` debajo de cada marcador `-- Q0X`.

---

**Material de apoyo:** [TEORIA.md](./TEORIA.md) · [CHEATSHEET.md](./CHEATSHEET.md)
