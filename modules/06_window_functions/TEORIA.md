# 06 — Window Functions (MySQL)

## Objetivo
Aprender a usar funciones de ventana para calcular valores agregados y rankings sin colapsar filas, manteniendo el detalle de los datos.

---

## Sintaxis básica
```sql
<funcion>() OVER (
  PARTITION BY <columna(s)>
  ORDER BY <columna(s)>
)
```

---

## Funciones comunes

### ROW_NUMBER
Numera filas dentro de cada partición.
```sql
ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY list_price DESC)
```

### RANK / DENSE_RANK
Asigna posición por orden:
- `RANK`: deja huecos si hay empates.
- `DENSE_RANK`: no deja huecos.

```sql
RANK() OVER (PARTITION BY category_id ORDER BY list_price DESC)
```

### LAG / LEAD
Accede a valores de filas anteriores o siguientes.
```sql
LAG(list_price) OVER (PARTITION BY category_id ORDER BY list_price DESC)
```

### Agregaciones con ventana
Ejemplo:
```sql
AVG(list_price) OVER (PARTITION BY category_id)
```

---

## Diferencia con GROUP BY
- **GROUP BY**: reduce filas (una por grupo).
- **Window Functions**: mantiene todas las filas y añade columnas calculadas.

---

## Ejemplo completo
```sql
SELECT product_id, category_id, list_price,
       ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY list_price DESC) AS rn,
       AVG(list_price) OVER (PARTITION BY category_id) AS avg_price
FROM products;
```
