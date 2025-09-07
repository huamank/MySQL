# 03 — Cheat‑sheet rápido (MySQL)

- INNER JOIN:
```sql
SELECT ...
FROM A
JOIN B ON A.key = B.key;
```

- LEFT JOIN:
```sql
SELECT ...
FROM A
LEFT JOIN B ON A.key = B.key;
```

- RIGHT JOIN:
```sql
SELECT ...
FROM A
RIGHT JOIN B ON A.key = B.key;
```

- JOIN múltiples:
```sql
FROM A
JOIN B ON ...
JOIN C ON ...
```
