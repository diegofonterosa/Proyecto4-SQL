# 🗄️ Proyecto 4 — Introducción a Bases de Datos SQL

[![SQL](https://img.shields.io/badge/SQL-PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Ejercicios](https://img.shields.io/badge/Ejercicios-9-success?style=flat-square)]()
[![Estado](https://img.shields.io/badge/Estado-Completado-brightgreen?style=flat-square)]()
[![ASIR](https://img.shields.io/badge/Formación-ASIR-0078D4?style=flat-square)]()

Colección de **9 consultas SQL** sobre una base de datos de gestión de vuelos y reservas. Este proyecto forma parte de la formación en **ASIR (Administración de Sistemas Informáticos en Red)** y cubre consultas de selección, filtrado, agrupación y joins sobre un modelo de datos real de aerolínea.

---

## 📂 Estructura del Proyecto

```
Proyecto4-SQL/
│
├── 📄 IntroBBDD.sql    # Script con las 9 consultas SQL resueltas
└── 📄 README.md
```

---

## 🗃️ Modelo de Datos

Las consultas trabajan sobre una base de datos de aerolínea compuesta por las siguientes tablas:

| Tabla | Descripción |
|---|---|
| `flights` | Vuelos con estado, horarios, retrasos y modelo de avión |
| `bookings` | Reservas con importe total y fecha |
| `tickets` | Billetes asociados a reservas y pasajeros |
| `aircrafts_data` | Modelos de avión disponibles con rango de vuelo |
| `airports_data` | Aeropuertos con ciudad y datos de ubicación |

---

## 📋 Consultas — Índice Completo

### 🔹 Consultas básicas con `SELECT` y `WHERE`

| # | Descripción | Cláusulas utilizadas |
|---|---|---|
| 01 | Vuelos con estado **On Time** | `SELECT`, `WHERE` |
| 02 | Reservas con importe total **mayor a 1.000.000** | `SELECT`, `WHERE` |
| 03 | Todos los modelos de avión disponibles | `SELECT` sobre `aircrafts_data` |
| 04 | Vuelos operados con un **Boeing 737** (código `733`) | `SELECT`, `WHERE` |
| 05 | Tickets de pasajeros llamados **Irina** | `WHERE`, `LIKE`, comodín `%` |

### 🔹 Agrupación con `GROUP BY` y `HAVING`

| # | Descripción | Cláusulas utilizadas |
|---|---|---|
| 06 | Ciudades con **más de un aeropuerto** | `GROUP BY`, `HAVING`, `COUNT()` |
| 07 | Número de vuelos por **modelo de avión** | `INNER JOIN`, `GROUP BY`, `COUNT()` |
| 08 | Reservas con **más de un billete** (varios pasajeros) | `INNER JOIN`, `GROUP BY`, `HAVING` |

### 🔹 Operaciones con fechas y tiempos

| # | Descripción | Funciones utilizadas |
|---|---|---|
| 09 | Vuelos con **retraso de salida superior a 1 hora** | `INTERVAL`, `EXTRACT(EPOCH FROM ...)`, aritmética de timestamps |

---

## 🔍 Detalle de Consultas Destacadas

### Ejercicio 6 — Ciudades con más de un aeropuerto
```sql
SELECT city, COUNT(*) AS numero_aeropuertos
FROM airports_data
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY numero_aeropuertos DESC;
```

### Ejercicio 7 — Vuelos por modelo de avión (con JOIN)
```sql
SELECT f.aircraft_code, a.model, COUNT(*) AS numero_vuelos
FROM flights f
    INNER JOIN aircrafts_data a ON f.aircraft_code = a.aircraft_code
GROUP BY f.aircraft_code, a.model
ORDER BY numero_vuelos DESC;
```

### Ejercicio 9 — Vuelos con retraso superior a 1 hora
```sql
SELECT flight_id, flight_no, scheduled_departure, actual_departure,
    (actual_departure - scheduled_departure) AS retraso,
    EXTRACT(EPOCH FROM (actual_departure - scheduled_departure))/60 AS retraso_minutos
FROM flights
WHERE actual_departure IS NOT NULL
    AND (actual_departure - scheduled_departure) > INTERVAL '1 hour'
ORDER BY retraso DESC;
```

---

## 🚀 Tecnologías Utilizadas

| Tecnología | Uso |
|---|---|
| **PostgreSQL** | Motor de base de datos principal |
| **SQL estándar** | Consultas `SELECT`, `WHERE`, `JOIN`, `GROUP BY` |
| **Funciones de fecha** | `INTERVAL`, `EXTRACT(EPOCH FROM ...)` para cálculo de retrasos |

---

## ▶️ Cómo Ejecutar las Consultas

### Requisitos
- [PostgreSQL](https://www.postgresql.org/download/) instalado y en ejecución
- Base de datos de demo de vuelos cargada (modelo `bookings` de PostgreSQL)

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/diegofonterosa/Proyecto4-SQL.git
cd Proyecto4-SQL

# 2. Conectarse a la base de datos
psql -U postgres -d nombre_base_de_datos

# 3. Ejecutar el script completo
\i IntroBBDD.sql

# O ejecutar consulta a consulta desde cualquier cliente SQL
```

> Las consultas son compatibles con cualquier cliente SQL: **pgAdmin**, **DBeaver**, **TablePlus** o la terminal `psql`.

---

## 🎯 Objetivos de Aprendizaje

- ✅ Realizar consultas `SELECT` con filtros `WHERE` y operadores de comparación
- ✅ Usar `LIKE` con comodines para búsqueda de patrones en texto
- ✅ Aplicar `GROUP BY` y `HAVING` para agrupaciones con condiciones
- ✅ Combinar tablas con `INNER JOIN`
- ✅ Trabajar con aritmética de fechas e intervalos de tiempo en PostgreSQL
- ✅ Usar funciones de agregación: `COUNT()`, `EXTRACT()`

---

## 👨‍💻 Autor

**Diego Pérez Fonterosa**

[![GitHub](https://img.shields.io/badge/GitHub-diegofonterosa-181717?style=flat-square&logo=github)](https://github.com/diegofonterosa)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Diego%20Pérez-0A66C2?style=flat-square&logo=linkedin)](https://linkedin.com/in/diegofonterosa)

> Cursando ASIR y Máster en Ciberseguridad

---

## 📄 Licencia

Este proyecto tiene fines educativos. Puedes usar, modificar y distribuir el código con libertad mencionando al autor original.
