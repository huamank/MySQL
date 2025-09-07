# 02 – WHERE, Filtros y ORDER BY (MySQL)

**Objetivos**
- Filtrar datos con `WHERE` usando diferentes operadores.
- Usar `ORDER BY` para controlar el orden final.
- Combinar filtros lógicos con `AND`, `OR`, `NOT`.

**Tablas**: `products`, `customers`, `orders`.

## Ejercicios
- **Q01:** Muestra `product_id`, `product_name` y `list_price` de los productos con `list_price > 100`, ordenados de mayor a menor precio.
- **Q02:** Lista `product_id`, `product_name` y `list_price` de productos de la categoría 1 o 3, ordenados por `category_id` ascendente y `list_price` descendente.
- **Q03:** Obtén `order_id`, `order_date` y `status` de pedidos con fecha en 2024, ordenados por `order_date`.
- **Q04:** Muestra `customer_id`, `first_name`, `last_name`, `city` de clientes que viven en 'Lima' o 'Cusco', ordenados por `city` y `first_name`.

Escribe tus consultas en `exercises.sql` debajo de cada marcador `-- Q0X`.

---

**Material de apoyo:** [TEORIA.md](./TEORIA.md) · [CHEATSHEET.md](./CHEATSHEET.md)
