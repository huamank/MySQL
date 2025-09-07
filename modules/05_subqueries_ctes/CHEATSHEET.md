# 05 — Cheat‑sheet rápido (MySQL)

- Subconsulta en WHERE:
```sql
WHERE col = (SELECT MAX(col) FROM tabla)
```

- Subconsulta en FROM:
```sql
FROM (SELECT ... FROM ...) AS alias
```

- Subconsulta en SELECT:
```sql
SELECT col1, (SELECT ...) AS nuevo_campo
```

- CTE:
```sql
WITH nombre_cte AS (SELECT ...)
SELECT * FROM nombre_cte;
```
