# 05 – Subconsultas y CTEs (MySQL)

**Objetivos**
- Usar subconsultas en distintas partes de una consulta.
- Aplicar CTEs (`WITH`) para estructurar consultas complejas.

**Tablas**: `products`, `categories`, `orders`, `customers`, `payments`.

## Ejercicios
- **Q01:** Usando una subconsulta en `WHERE`, muestra `product_id`, `product_name` y `list_price` del/los producto(s) con el precio máximo.
- **Q02:** Con una subconsulta en `FROM`, muestra `category_id` y `promedio_precio` de categorías con precio promedio > 200.
- **Q03:** Usando una subconsulta en `SELECT`, muestra `product_id`, `product_name` y el `category_name` correspondiente.
- **Q04:** Usando un CTE, muestra `customer_id`, `first_name`, `last_name` y `total_gastado` para clientes que hayan gastado más de 500, ordenados del mayor al menor gasto.

Escribe tus consultas en `exercises.sql` debajo de cada marcador `-- Q0X`.

---

**Material de apoyo:** [TEORIA.md](./TEORIA.md) · [CHEATSHEET.md](./CHEATSHEET.md)
