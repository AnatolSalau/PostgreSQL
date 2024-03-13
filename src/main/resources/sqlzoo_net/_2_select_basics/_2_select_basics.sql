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
VALUES
('Afghanistan',	'Asia',	652230,	25500100,	20343000000),
('Albania',	'Europe',	652230,	25500100,	20343000000),
('Algeria',	'Africa',	652230,	25500100,	20343000000),
('Andorra',	'Europe',	652230,	25500100,	20343000000),
('Angola',	'Africa',	652230,	25500100,	20343000000),
('Germany',	'Europe',	652230,	25500100,	20343000000);
/* select population germany */
SELECT population FROM world WHERE name = 'Germany';
