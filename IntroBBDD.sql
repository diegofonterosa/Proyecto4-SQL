-- EJERCICIO 1
-- Escribe una consulta que recupere los Vuelos (flights) y su 
-- identificador que figuren con status On Time.

SELECT 
    flight_id,
    *
FROM 
    flights
WHERE 
    status = 'On Time';

-- EJERCICIO 2
-- Escribe una consulta que extraiga todas las columnas de la tabla 
-- bookings y refleje todas las reservas que han supuesto una cantidad 
-- total mayor a 1.000.000 (Unidades monetarias).

SELECT 
    *
FROM 
    bookings
WHERE 
    total_amount > 1000000;

-- EJERCICIO 3
-- Escribe una consulta que extraiga todas las columnas de los datos 
-- de los modelos de aviones disponibles (aircrafts_data o aircraft_data).

SELECT 
    aircraft_code,
    model,
    range
FROM 
    aircrafts_data;

-- EJERCICIO 4
-- Con el resultado anterior visualizado previamente, escribe una consulta 
-- que extraiga los identificadores de vuelo que han volado con un Boeing 737.
-- (Código Modelo Avión = 733)

SELECT 
    flight_id,
    flight_no,
    aircraft_code
FROM 
    flights
WHERE 
    aircraft_code = '733';

-- EJERCICIO 5
-- Escribe una consulta que te muestre la información detallada de los 
-- tickets que han comprado las personas que se llaman Irina.

SELECT 
    t.*
FROM 
    tickets t
WHERE 
    t.passenger_name LIKE '%IRINA%';

-- EJERCICIO 6 
-- Mostrar las ciudades con más de un aeropuerto.

SELECT 
    city,
    COUNT(*) AS numero_aeropuertos
FROM 
    airports_data
GROUP BY 
    city
HAVING 
    COUNT(*) > 1
ORDER BY 
    numero_aeropuertos DESC;

-- EJERCICIO 7 
-- Mostrar el número de vuelos por modelo de avión.

SELECT 
    f.aircraft_code,
    a.model,
    COUNT(*) AS numero_vuelos
FROM 
    flights f
    INNER JOIN aircrafts_data a ON f.aircraft_code = a.aircraft_code
GROUP BY 
    f.aircraft_code, a.model
ORDER BY 
    numero_vuelos DESC;

-- EJERCICIO 8 
-- Reservas con más de un billete (varios pasajeros).

SELECT 
    b.book_ref,
    b.book_date,
    b.total_amount,
    COUNT(t.ticket_no) AS numero_billetes
FROM 
    bookings b
    INNER JOIN tickets t ON b.book_ref = t.book_ref
GROUP BY 
    b.book_ref, b.book_date, b.total_amount
HAVING 
    COUNT(t.ticket_no) > 1
ORDER BY 
    numero_billetes DESC;

-- EJERCICIO 9 
-- Vuelos con retraso de salida superior a una hora.

SELECT 
    flight_id,
    flight_no,
    scheduled_departure,
    actual_departure,
    (actual_departure - scheduled_departure) AS retraso,
    EXTRACT(EPOCH FROM (actual_departure - scheduled_departure))/60 AS retraso_minutos
FROM 
    flights
WHERE 
    actual_departure IS NOT NULL
    AND (actual_departure - scheduled_departure) > INTERVAL '1 hour'
ORDER BY 
    retraso DESC;
