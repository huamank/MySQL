# 02 — Cheat‑sheet rápido (MySQL)

- Comparación y rango:
```sql
WHERE col > 100
WHERE col BETWEEN 50 AND 200
```

- Conjunto y nulos:
```sql
WHERE col IN ('A','B','C')
WHERE col IS NULL
```

- Patrones:
```sql
WHERE name LIKE 'Camisa%'
WHERE code LIKE 'AB_'
```

- Orden múltiple:
```sql
ORDER BY col1 ASC, col2 DESC
```
