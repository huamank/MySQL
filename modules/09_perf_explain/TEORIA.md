# 09 — Optimización y EXPLAIN (MySQL)

## Objetivo
Usar `EXPLAIN` para entender el plan de ejecución de una consulta y aplicar mejoras mediante índices y reescritura de consultas.

---

## Uso básico de EXPLAIN
```sql
EXPLAIN SELECT * FROM orders WHERE customer_id = 5;
```

---

## Columnas clave en el resultado
- **id**: identificador del paso de ejecución.
- **select_type**: tipo de consulta (SIMPLE, PRIMARY, SUBQUERY).
- **table**: tabla involucrada.
- **type**: tipo de acceso a datos (ALL, index, ref, eq_ref, const, system, NULL).  
  De peor a mejor: `ALL` → `index` → `ref` → `eq_ref` → `const`.
- **possible_keys**: índices que podrían usarse.
- **key**: índice realmente usado.
- **rows**: número estimado de filas a leer.
- **Extra**: información adicional (Using index, Using where, Using filesort, etc.).

---

## Mejores prácticas
1. Crear índices en columnas utilizadas en filtros y joins.
2. Evitar `SELECT *` en consultas críticas.
3. Filtrar lo más pronto posible con `WHERE`.
4. Usar JOINs apropiados y evitar subconsultas innecesarias.
5. Revisar el log de consultas lentas y optimizar las más costosas.

---

## Ejemplo con índice
```sql
CREATE INDEX idx_orders_customer ON orders(customer_id);

EXPLAIN SELECT * FROM orders WHERE customer_id = 5;
```
Si `key` = `idx_orders_customer` y `type` es `ref`, el índice está siendo usado correctamente.

---

## Ver índices
```sql
SHOW INDEXES FROM orders;
```
