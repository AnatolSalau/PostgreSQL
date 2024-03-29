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

/*List each country name where the population is larger than that of 'Andorra'. */

SELECT name, population FROM world
WHERE population >
      (SELECT population FROM world
            WHERE name IN ('Andorra'));

/*
 3. https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
 List the name and continent of countries in the continents containing
 either Andorra or Angola. Order by name of the country.
 */

SELECT name, continent FROM world
WHERE continent IN
      (SELECT continent FROM world
            WHERE name IN ('Andorra', 'Angola'))
ORDER BY name;



