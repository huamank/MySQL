# 01 — Teoría de SELECT (MySQL)

## Objetivo
Dominar la lectura de tablas con `SELECT`, el uso de *alias*, el ordenamiento con `ORDER BY` y la paginación con `LIMIT`.

---
## Sintaxis mínima
```sql
SELECT <lista_de_columnas>
FROM <tabla>
[WHERE <condición>]
[ORDER BY <columna> [ASC|DESC], ...]
[LIMIT <n> [OFFSET <m>]];
```
> **MySQL** también admite `LIMIT <offset>, <count>` (forma corta).

### Orden lógico de ejecución (mental model)
1) `FROM` → 2) `WHERE` → 3) `SELECT` → 4) `ORDER BY` → 5) `LIMIT`  
*(Es por esto que no puedes usar un alias de columna en `WHERE`, porque aún no “existe”. Sí puedes en `ORDER BY`.)*

---

## Alias con `AS`
- Mejoran legibilidad y permiten renombrar columnas.
- En MySQL, si el alias tiene espacios o caracteres especiales, usa **backticks**:
  ```sql
  SELECT list_price AS price, list_price * 0.18 AS `IGV (18%)`
  FROM products;
  ```

---

## `ORDER BY`
- Por defecto es **ASC** (ascendente).
- Puedes ordenar por múltiples columnas y por **alias**:
  ```sql
  SELECT product_id, product_name, list_price AS price
  FROM products
  ORDER BY price DESC, product_id ASC;
  ```
- Evita ordenar por posición (`ORDER BY 1`) en código real; usa nombres/alias.

> **Regla de oro**: si necesitas resultados determinísticos, **SIEMPRE** especifica `ORDER BY`.

---

## `LIMIT` y paginación
- Traer los 5 primeros:
  ```sql
  SELECT product_id, product_name
  FROM products
  ORDER BY product_id
  LIMIT 5;
  ```
- Paginación (dos formas equivalentes):
  ```sql
  -- Página 3, tamaño 10 (offset = 20)
  SELECT ...
  LIMIT 10 OFFSET 20;

  SELECT ...
  LIMIT 20, 10; -- (offset, count)
  ```

---

## `DISTINCT`
- Elimina duplicados de la proyección.
  ```sql
  SELECT DISTINCT category_id FROM products;
  ```
- Para contar valores únicos:
  ```sql
  SELECT COUNT(DISTINCT category_id) AS categorias_distintas
  FROM products;
  ```
> Consejo: `DISTINCT` actúa sobre **todas** las columnas listadas tras él.

---

## Buenas prácticas
- Evita `SELECT *` en entregables finales; especifica columnas.
- Nombra alias consistentes (`price`, `customer_count`, etc.).
- Comenta decisiones no obvias (`-- incluimos inactivos para comparación histórica`).

---

## Errores comunes
- Esperar orden consistente **sin** `ORDER BY` → *no garantizado*.
- Usar alias en `WHERE` → no funciona (aún no se materializa el `SELECT`).
- Mezclar comillas: en MySQL usa *backticks* para identificadores/alias con espacios, comillas simples para **strings**.

---

## Tablas usadas en este módulo
- `products(product_id, category_id, product_name, list_price, cost, active, created_at)`
- `categories(category_id, category_name)`

---

## Ejemplos guiados (sin spoilear ejercicios)
**Top 3 productos más caros (id, nombre, precio):**
```sql
SELECT product_id, product_name, list_price AS price
FROM products
ORDER BY price DESC
LIMIT 3;
```

**Nombres de categorías en orden alfabético (únicos):**
```sql
SELECT DISTINCT category_name
FROM categories
ORDER BY category_name;
```

**10 productos activos más recientes por `created_at`:**
```sql
SELECT product_id, product_name, created_at
FROM products
WHERE active = 1
ORDER BY created_at DESC, product_id
LIMIT 10;
```

---

## Mini‑quiz (auto-chequeo)
1) ¿Por qué no puedes usar un alias en `WHERE` pero sí en `ORDER BY`?  
2) Escribe dos formas válidas de traer filas 21–30.  
3) ¿Qué hace `DISTINCT category_id, product_id` si hay duplicados por par?

> Respuestas esperadas: (1) Porque `WHERE` se evalúa antes que `SELECT`, `ORDER BY` después. (2) `LIMIT 10 OFFSET 20` y `LIMIT 20, 10`. (3) Devuelve pares únicos; elimina duplicados considerando **ambas** columnas.
