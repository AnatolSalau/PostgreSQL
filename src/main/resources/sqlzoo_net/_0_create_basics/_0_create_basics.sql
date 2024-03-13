-- create table world_ten_id with id increment through 10
/*
       INSERT INTO world (name, continent, area, population, gdp)
      VALUES
      1 ('Afghanistan',	'Asia',	652230,	25500100,	20343000000),
      10 ('Albania',	'Europe',	652230,	25500100,	20343000000),
      20 ('Algeria',	'Africa',	652230,	25500100,	20343000000),
      30 ('Andorra',	'Europe',	652230,	25500100,	20343000000),
      40 ('Angola',	'Africa',	652230,	25500100,	20343000000),
      50 ('Germany',	'Europe',	652230,	25500100,	20343000000);
 */

CREATE SEQUENCE IF NOT EXISTS world_ten_id_seq
      minvalue 0
      start 0
      increment 10;


CREATE TABLE IF NOT EXISTS world_ten (
      id bigint not null default nextval('world_ten_id_seq') primary key,
      name varchar(128) not null,
      continent varchar(128) not null,
      area bigint not null,
      population bigint not null,
      gdp bigint not null
);

alter sequence world_ten_id_seq owned by world_ten.id;

INSERT INTO world_ten (name, continent, area, population, gdp)
VALUES
('Afghanistan',	'Asia',	652230,	25500100,	20343000000),
      ('Albania',	'Europe',	652230,	25500100,	20343000000),
      ('Algeria',	'Africa',	652230,	25500100,	20343000000),
      ('Andorra',	'Europe',	652230,	25500100,	20343000000),
      ('Angola',	'Africa',	652230,	25500100,	20343000000),
      ('Germany',	'Europe',	652230,	25500100,	20343000000);
