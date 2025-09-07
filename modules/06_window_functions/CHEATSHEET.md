# 06 — Cheat‑sheet rápido (MySQL)

- Top N por grupo:
```sql
SELECT *
FROM (
  SELECT product_id, category_id, list_price,
         ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY list_price DESC) AS rn
  FROM products
) sub
WHERE rn <= 3;
```

- Diferencia con fila anterior:
```sql
SELECT product_id, list_price,
       list_price - LAG(list_price) OVER (ORDER BY list_price) AS diff_prev
FROM products;
```

- Promedio por grupo:
```sql
SELECT product_id, category_id, list_price,
       AVG(list_price) OVER (PARTITION BY category_id) AS avg_price
FROM products;
```
