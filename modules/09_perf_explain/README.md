# 09 – Optimización y EXPLAIN (MySQL)

**Objetivos**
- Interpretar el plan de ejecución con `EXPLAIN`.
- Crear y verificar el uso de índices.
- Optimizar consultas para reducir el número de filas leídas.

**Tablas**: `orders`, `order_items`, `products`, `customers`.

## Ejercicios
- **Q01:** Usa `EXPLAIN` para ver el plan de ejecución de:
```sql
SELECT * FROM orders WHERE customer_id = 10;
```

- **Q02:** Crea un índice en `orders(customer_id)` y verifica con `EXPLAIN` que se use en la consulta anterior.

- **Q03:** Usa `EXPLAIN` para analizar:
```sql
SELECT o.order_id, c.first_name, p.product_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
```

- **Q04:** Propón una mejora para reducir el número de filas leídas en el ejercicio Q03.

Escribe tus consultas o sentencias en `exercises.sql` debajo de cada marcador `-- Q0X`.

---

**Material de apoyo:** [TEORIA.md](./TEORIA.md) · [CHEATSHEET.md](./CHEATSHEET.md)
