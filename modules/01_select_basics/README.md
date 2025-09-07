# 01 – SELECT Basics (MySQL)
**Objetivos**
- Seleccionar columnas específicas
- Renombrar con `AS`
- Limitar filas con `LIMIT`

**Tablas**: `products`, `categories`

## Ejercicios
- **Q01:** Lista `product_id`, `product_name` y `list_price` de los 10 primeros productos ordenados por `product_id` ascendente.
- **Q02:** Devuelve el listado *único* de `category_name` de la tabla `categories` ordenado alfabéticamente.
- **Q03:** Muestra los 5 productos con mayor `list_price`, mostrando `product_id`, `product_name`, `list_price`.
- **Q04 (bonus):** Muestra los 10 productos activos (`active = 1`) más recientes según `created_at` (desc).

Escribe tu solución en `exercises.sql` debajo de cada marcador `-- Q0X`.

---

**Material de apoyo:** [TEORIA.md](./TEORIA.md) · [CHEATSHEET.md](./CHEATSHEET.md)
