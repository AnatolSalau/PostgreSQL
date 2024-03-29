/*
1.
      The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';
      Modify it to show the population of Germany

      world
      id name	continent	area	population	gdp
      1 Afghanistan	Asia	652230	25500100	20343000000
      2 Albania	Europe	28748	2831741	12960000000
      3 Algeria	Africa	2381741	37100000	188681000000
      4 Andorra	Europe	468	78115	3712000000
      5 Angola	Africa	1246700	20609294	100990000000
*/
CREATE TABLE IF NOT EXISTS world (
      id bigserial primary key,
      name varchar(128),
      continent varchar(128),
      area bigint,
      population bigint,
      gdp bigint
);

INSERT INTO world (name, continent, area, population, gdp)
VALUES ('Afghanistan', 'Asia', 100230, 35500100, 20343000000),
       ('Albania', 'Europe', 100230, 35500100, 20343000000),
       ('Algeria', 'Africa', 200230, 15500100, 30343000000),
       ('Andorra', 'Europe', 200230, 15500100, 30343000000),
       ('Angola', 'Africa', 300230, 25500100, 40343000000),
       ('Germany', 'Europe', 300230, 25500100, 40343000000);

/* select population germany */
SELECT population FROM world WHERE name = 'Germany';

/*Show the name and the population for 'Algeria', 'Angola' and 'Germany'.*/

SELECT name, population FROM world
WHERE name IN  ('Algeria','Angola','Germany');

/*show the country and the area for countries with an area between 200,000 and 250,000.*/

SELECT name, area FROM world
WHERE area between 200000 and  250000;

SELECT name, area FROM world
WHERE area >= 200000 and  area <= 250000;

/*Show the name and population in millions for the countries of the continent 'Africa'.
  Divide the population by 1000000 to get population in millions.
 */

SELECT name, population / 1000000 FROM world
WHERE continent IN ('Africa');

/*
Two ways to be big: A country is big if it has an area of more than 3 million sq km
or it has a population of more than 20 million.
Show the countries that are big by area or big by population. Show name, population and area.
 */

SELECT name, area / 100000,  population / 1000000 FROM world
WHERE (population / 1000000) > 2 OR  area > 20;

/*
 8.
Exclusive OR (XOR). Show the countries that are big by area (more than 1 million)
 or big by population (more than 15 million) but not both. Show name, population and area.
 */
SELECT name, area / 100000,  population / 1000000 FROM world
WHERE ((population / 1000000) > 15 AND (population / 1000000) < 35) OR  area / 100000 > 1 ;


SELECT name, ROUND( area,2) FROM world;