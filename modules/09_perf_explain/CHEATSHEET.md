# 09 — Cheat‑sheet rápido (MySQL)

- Ver plan de ejecución:
```sql
EXPLAIN SELECT ...;
```

- Crear índice:
```sql
CREATE INDEX idx_name ON table(column);
```

- Ver índices existentes:
```sql
SHOW INDEXES FROM table;
```

- Eliminar índice:
```sql
DROP INDEX idx_name ON table;
```
