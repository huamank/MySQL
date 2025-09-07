# 01 — Cheat‑sheet rápido (MySQL)

- Top-N ordenado:
```sql
SELECT col1, col2
FROM tabla
ORDER BY colX DESC
LIMIT N;
```

- Paginación:
```sql
SELECT ...
FROM ...
ORDER BY id
LIMIT 10 OFFSET 20;   -- o: LIMIT 20, 10
```

- Alias seguros (con espacios/símbolos):
```sql
SELECT col AS `Mi Alias`
FROM tabla;
```

- Únicos y conteo de únicos:
```sql
SELECT DISTINCT col FROM tabla;
SELECT COUNT(DISTINCT col) FROM tabla;
```
