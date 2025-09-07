# 02 — WHERE, Filtros y ORDER BY (MySQL)

## Objetivo
Aprender a filtrar filas usando `WHERE`, operadores lógicos, comparación, rangos (`BETWEEN`), conjuntos (`IN`) y patrones (`LIKE`), así como ordenar resultados con `ORDER BY`.

---

## `WHERE`
Filtra filas antes de que se proyecten columnas.

### Comparaciones
```sql
SELECT product_id, list_price
FROM products
WHERE list_price > 100;
```

### Lógicos
- `AND`: ambas condiciones verdaderas.
- `OR`: al menos una verdadera.
- `NOT`: niega condición.

```sql
WHERE active = 1 AND list_price BETWEEN 50 AND 200;
```

### Rango
```sql
WHERE order_date BETWEEN '2023-01-01' AND '2023-06-30';
```

### Conjuntos
```sql
WHERE category_id IN (1, 3, 5);
```

### Nulos
```sql
WHERE payment_date IS NULL;
```

### Patrones (`LIKE`)
- `%`: cualquier número de caracteres.
- `_`: un solo carácter.

```sql
WHERE product_name LIKE 'Camisa%';
```

### Sensibilidad a mayúsculas/minúsculas
Depende del *collation*; en `utf8mb4_0900_ai_ci` (`ci` = case-insensitive) no distingue mayúsculas.

---

## `ORDER BY` avanzado
- Orden por múltiples columnas:
```sql
ORDER BY category_id ASC, list_price DESC;
```
- Orden por expresión:
```sql
ORDER BY YEAR(order_date) DESC, MONTH(order_date) ASC;
```

---

## Buenas prácticas
- Especifica `ORDER BY` cuando importe la presentación.
- Usa paréntesis en combinaciones `AND`/`OR` para evitar ambigüedad.
- Prefiere listas explícitas en `IN` frente a múltiples `OR`.

---

## Tablas clave
- `products`
- `orders`
- `customers`

---

## Ejemplos guiados
**Productos activos con precio > 100, ordenados de mayor a menor precio:**
```sql
SELECT product_id, product_name, list_price
FROM products
WHERE active = 1 AND list_price > 100
ORDER BY list_price DESC;
```

**Pedidos de Lima o Cusco en 2024:**
```sql
SELECT o.order_id, c.city, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city IN ('Lima','Cusco') AND YEAR(o.order_date) = 2024
ORDER BY o.order_date;
```
