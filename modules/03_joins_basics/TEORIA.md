# 03 — JOINs básicos (MySQL)

## Objetivo
Aprender a combinar datos de múltiples tablas usando `JOIN` (INNER, LEFT, RIGHT), entendiendo cómo se vinculan mediante claves primarias y foráneas.

---

## Tipos de JOIN

### INNER JOIN
Devuelve solo filas con coincidencia en ambas tablas.
```sql
SELECT p.product_id, p.product_name, c.category_name
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id;
```

### LEFT JOIN
Devuelve todas las filas de la tabla izquierda y solo las coincidentes de la derecha (NULL si no hay match).
```sql
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
```

### RIGHT JOIN
Opuesto a LEFT JOIN: devuelve todas las filas de la tabla derecha y solo las coincidentes de la izquierda.

---

## Aliases y buenas prácticas
- Usa alias cortos (`p`, `c`, `o`) para mejorar legibilidad.
- Siempre especifica la condición `ON` (evita CROSS JOIN accidentales).

---

## Múltiples JOIN
Puedes unir más de dos tablas:
```sql
SELECT o.order_id, c.first_name, p.product_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
```

---

## Errores comunes
- Olvidar condición `ON` → CROSS JOIN.
- Duplicar filas por relaciones 1‑N (usa `DISTINCT` o agregaciones si es necesario).

---

## Ejemplos guiados
**Pedidos con nombre de cliente:**
```sql
SELECT o.order_id, o.order_date, c.first_name, c.last_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
```

**Productos con nombre de categoría:**
```sql
SELECT p.product_id, p.product_name, cat.category_name
FROM products p
JOIN categories cat ON p.category_id = cat.category_id;
```
