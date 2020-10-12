--
-- Source code from the article: "SQL Joins Tutorial: Working with Databases"
-- written by Josh Devlin
--

-- Our First SQL JOIN
SELECT
  *
FROM
  facts
INNER JOIN
  cities ON cities.facts_id = facts.id
LIMIT
  5;

-- Understanding SQL Inner Joins
SELECT
  *
FROM
  facts AS f
INNER JOIN
  cities AS c ON c.facts_id = f.id
LIMIT
  5;

-- Join cities to facts using INNER JOIN.
-- Use aliases for table names.
-- Include in order:
--  All columns from cities.
--  The name column from facts aliased to country_name.
-- Include only the first 5 rows.
SELECT
  c.*,
  f.name AS country_name
FROM
  facts AS f
INNER JOIN
  cities AS c ON c.facts_id = f.id
LIMIT
  5;

-- Practicing Inner Joins in SQL
SELECT
  f.name,
  c.name
FROM
  facts AS f
INNER JOIN
  cities AS c ON c.facts_id = f.id;

-- Include only capital cities.
SELECT
  f.name,
  c.name
FROM
  facts AS f
INNER JOIN
  cities AS c ON c.facts_id = f.id
WHERE
 c.capital = 1
LIMIT
  10;

-- Left Joins in SQL
SELECT
  COUNT(DISTINCT (name))
FROM
  facts;

SELECT
  COUNT(DISTINCT (facts_id))
FROM
  cities;

SELECT
  *
FROM
  facts
LEFT JOIN
  cities ON cities.facts_id = facts.id;

SELECT
  f.name AS country,
  f.population
FROM
  facts AS f
LEFT JOIN
 cities AS C ON c.facts_id = f.id
WHERE
  c.name IS NULL;

-- Finding the Most Populous Capital Cities

SELECT
  name,
  migration_rate
FROM
  facts
ORDER BY
  migration_rate desc;

SELECT
  name,
  migration_rate
FROM
  facts
ORDER BY
  2 DESC;

SELECT
  c.name AS capital_city,
  f.name AS country,
  c.population
FROM
  facts AS f
INNER JOIN
  cities AS c ON c.facts_id = f.id
WHERE
  c.capital = 1
ORDER BY
  3 DESC
LIMIT
  10;

-- Combining SQL Joins with Subqueries
SELECT
  f.name AS country,
  c.name AS capital_city
FROM
  facts AS f
INNER JOIN
  (
    SELECT
      *
    FROM
      cities
    WHERE
      capital = 1
  ) As c ON c.facts_id = f.id
LIMIT 10;

SELECT
  c.name AS city,
  f.name AS country,
  c.population AS population
FROM
  facts AS f
INNER JOIN
    (
      SELECT
        *
      FROM
        cities
      WHERE
        capital = 0 AND
        population > 10000000
    ) As c ON c.facts_id = f.id
ORDER BY
  3 DESC;
