# 07 — Cheat‑sheet rápido (MySQL)

- Año / Mes / Día:
```sql
YEAR(fecha), MONTH(fecha), DAY(fecha)
```

- Formato fecha:
```sql
DATE_FORMAT(fecha, '%d/%m/%Y')
```

- Diferencia en días:
```sql
DATEDIFF(fecha1, fecha2)
```

- Texto en mayúsculas:
```sql
UPPER(columna)
```

- Substring y reemplazo:
```sql
SUBSTRING(columna, inicio, longitud)
REPLACE(columna, 'buscar', 'reemplazar')
```

- Concatenar:
```sql
CONCAT(col1, ' ', col2)
CONCAT_WS('-', col1, col2, col3)
```
