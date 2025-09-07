# 04 — Cheat‑sheet rápido (MySQL)

- Conteo total:
```sql
SELECT COUNT(*) FROM orders;
```

- Conteo por grupo:
```sql
SELECT status, COUNT(*) FROM orders GROUP BY status;
```

- Agregaciones múltiples:
```sql
SELECT category_id, AVG(list_price), MIN(list_price), MAX(list_price)
FROM products
GROUP BY category_id;
```

- Filtrar grupos por agregados:
```sql
HAVING COUNT(*) > 5
```
