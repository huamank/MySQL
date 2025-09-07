# 08 – Modelado de datos y constraints en SQL (MySQL)

**Objetivos**
- Definir claves primarias y foráneas.
- Aplicar restricciones (`NOT NULL`, `UNIQUE`, `CHECK`).
- Crear índices para optimizar consultas.

**Tablas**: Ejemplos conceptuales.

## Ejercicios
- **Q01:** Escribe una sentencia `CREATE TABLE` para `suppliers` con `supplier_id` como PK, nombre obligatorio y email único.
- **Q02:** Crea una tabla `shipments` con `shipment_id` como PK y una FK `order_id` que apunte a `orders(order_id)`.
- **Q03:** Agrega un constraint `CHECK` a `products` para que `list_price` sea > 0.
- **Q04:** Crea un índice en `order_items` para acelerar búsquedas por `product_id`.

Escribe tus sentencias en `exercises.sql` debajo de cada marcador `-- Q0X`.

---

**Material de apoyo:** [TEORIA.md](./TEORIA.md) · [CHEATSHEET.md](./CHEATSHEET.md)
