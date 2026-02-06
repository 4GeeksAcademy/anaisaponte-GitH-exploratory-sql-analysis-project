-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1 (NIVEL 1): Exploración básica (SELECT, LIMIT, DISTINCT, WHERE)

-- ¿Cuáles son las primeras 10 observaciones registradas?
-- Utiliza LIMIT para mostrar solo una parte de la tabla.;

SELECT * 
FROM observations
LIMIT 10;

-- ¿Qué identificadores de región (region_id) aparecen en los datos?
-- Usa SELECT DISTINCT para evitar repeticiones.;

--PRAGMA table_info(regions);
SELECT DISTINCT *
FROM regions;

-- ¿Cuántas especies distintas (species_id) se han observado?
-- Combina COUNT con DISTINCT para no contar duplicados;
-- PRAGMA table_info(species);
SELECT COUNT(DISTINCT id)
FROM species;

-- ¿Cuántas observaciones hay para la región con region_id = 2?
-- Aplica una condición con WHERE.;
SELECT COUNT(*)
FROM observations
WHERE region_id = 2;

-- ¿Cuántas observaciones se registraron el día 1998-08-08?
-- Filtra por fecha exacta usando igualdad.;

SELECT COUNT(*)
FROM observations
WHERE observation_date = '1998-08-08';


-- MISSION 2 (NIVEL 2): Agregación y ordenamiento (GROUP BY, COUNT, ORDER BY, HAVING sin JOIN)

-- ¿Cuál es el region_id con más observaciones?
-- Agrupa por región y cuenta cuántas veces aparece cada una.;
PRAGMA table_info(observations);
SELECT region_id, COUNT(*) AS total_observations
FROM observations
GROUP BY region_id;

-- ¿Cuáles son los 5 species_id más frecuentes?
-- Agrupa, ordena por cantidad descendente y limita el resultado.;
SELECT species_id, COUNT(*) AS total_observations
FROM observations
GROUP BY species_id
ORDER BY total_observations DESC
LIMIT 5


-- ¿Qué especies (species_id) tienen menos de 5 registros?
-- Agrupa por especie y usa HAVING para aplicar una condición.;
SELECT species_id, COUNT(*) AS total_observations
FROM observations
GROUP BY species_id
HAVING COUNT(*) < 5

-- ¿Qué observadores (observer) registraron más observaciones?
-- Agrupa por el nombre del observador y cuenta los registros.;

SELECT observer, COUNT(*) AS total_observations
FROM observations
GROUP BY observer
ORDER BY total_observations DESC



-- MISSION 3 (NIVEL 3): Relaciones entre tablas (JOIN) --

-- Muestra el nombre de la región (regions.name) para cada observación.
-- Relaciona observations con regions usando region_id;
SELECT o.id, r.name
FROM observations o JOIN regions r ON r.id = o.region_id;


-- Muestra el nombre científico de cada especie registrada (species.scientific_name).
-- Relaciona observations con species usando species_id;
SELECT s.scientific_name
FROM observations o JOIN species s ON s.id = o.species_id;


-- ¿Cuál es la especie más observada por cada región?
-- Agrupa por región y especie, y ordena por cantidad;
SELECT species_id, COUNT(*) AS total_observations, region_id
FROM observations 
GROUP BY region_id, species_id
ORDER BY COUNT(*)

-- MISSION 4 (NIVEL 4): Manipulación de datos






