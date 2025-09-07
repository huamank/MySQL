# Ruta SQL – Hazlo con Datos (MySQL)
Este repositorio contiene datasets *dummy* y ejercicios de SQL.

## Cómo empezar (local, MySQL)
1. Asegúrate de tener MySQL instalado y habilitado `local_infile`.
2. Clona el repo y entra a la carpeta.
3. Ejecuta:
```bash
mysql --local-infile=1 -u <usuario> -p < setup/build_db_mysql.sql
```
Esto creará la BD `hazlocondatos_sql` y cargará todos los CSV.

## Practica el Módulo 01
- Abre `modules/01_select_basics/exercises.sql` y escribe tus consultas.
- Usa tu cliente favorito (MySQL Workbench, DBeaver, consola) contra `hazlocondatos_sql`.
- Compara resultados con `modules/01_select_basics/expected/q01.csv` (por ahora solo Q01).

## Estructura
- `datasets/tienda` y `datasets/streaming`: datos de e-commerce y de una plataforma de streaming.
- `setup/build_db_mysql.sql`: script para crear y cargar tablas.
- `modules/`: ejercicios por módulo.

> Próximos pasos: automatizar pruebas con GitHub Actions (servicio MySQL) y agregar más expected por ejercicio.
