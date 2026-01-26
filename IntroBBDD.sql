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