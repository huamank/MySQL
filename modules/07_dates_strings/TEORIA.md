# 07 — Funciones de fecha y cadena (MySQL)

## Objetivo
Aprender a manipular y formatear datos de tipo fecha y texto usando funciones integradas de MySQL.

---

## Funciones de fecha

### Obtener partes de la fecha
```sql
YEAR(order_date)       -- Año
MONTH(order_date)      -- Mes (1-12)
DAY(order_date)        -- Día
DAYNAME(order_date)    -- Nombre del día
```

### Operaciones con fechas
```sql
DATE_ADD(order_date, INTERVAL 7 DAY)     -- Suma días
DATE_SUB(order_date, INTERVAL 1 MONTH)   -- Resta meses
DATEDIFF(fecha1, fecha2)                 -- Diferencia en días
```

### Formateo de fechas
```sql
DATE_FORMAT(order_date, '%d/%m/%Y')      -- DD/MM/AAAA
```

---

## Funciones de cadena

### Longitud y mayúsculas/minúsculas
```sql
LENGTH(product_name)   -- Longitud en bytes
CHAR_LENGTH(product_name) -- Longitud en caracteres
UPPER(product_name)
LOWER(product_name)
```

### Subcadenas y reemplazos
```sql
SUBSTRING(product_name, 1, 5)       -- Primeros 5 caracteres
REPLACE(product_name, 'abc', 'xyz') -- Reemplazo
```

### Concatenar
```sql
CONCAT(first_name, ' ', last_name)
CONCAT_WS('-', col1, col2, col3)    -- Con separador
```

---

## Ejemplo práctico
**Pedidos en 2024 con mes y año en columnas separadas:**
```sql
SELECT order_id,
       YEAR(order_date) AS anio,
       MONTH(order_date) AS mes
FROM orders
WHERE YEAR(order_date) = 2024;
```

**Nombre completo y email en un solo campo:**
```sql
SELECT CONCAT(first_name, ' ', last_name, ' <', email, '>') AS contacto
FROM customers;
```
