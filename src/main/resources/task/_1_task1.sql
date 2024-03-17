/**
 CITY
 id
 code
 name

 DISTRICT
 id
 city_id
 name

 HOUSE
 id
 district_id
 number_of_floors

 SQL задача.
 Вывести наименование районов, где code города = мск, где есть дома с кол-вом
 этажем менее 6
 И число таких домов на районе более одного
 */

CREATE TABLE IF NOT EXISTS CITY
(
    id   bigserial    not null primary key ,
    code varchar(128)       not null unique,
    name varchar(128) not null
);

CREATE TABLE IF NOT EXISTS DISTRICT
(
    id      bigserial    not null primary key ,
    city_id bigint       not null,
    name    varchar(128) not null
);

ALTER TABLE DISTRICT
    ADD CONSTRAINT "FK_city_id"
    FOREIGN KEY ("city_id") REFERENCES CITY ("id");


CREATE TABLE IF NOT EXISTS HOUSE
(
    id               bigserial not null primary key ,
    district_id      bigint    not null,
    number_of_floors bigint    not null
);

ALTER TABLE HOUSE
    ADD CONSTRAINT "FK_district_id"
    FOREIGN KEY ("district_id") REFERENCES DISTRICT ("id");

INSERT INTO CITY (code, name)
VALUES ('pol', 'city_1'),
       ('min', 'city_2'),
       ('mck', 'city_3'),
       ('var', 'city_4');

INSERT INTO DISTRICT (city_id, name)
VALUES (1, 'district_1'),
       (2, 'district_2'),
       (3, 'district_3'),
       (4, 'district_4');



INSERT INTO HOUSE (district_id, number_of_floors)
VALUES (1, 5),
       (1, 5),
       (2, 5),
       (2, 5),
       (3, 5), -- right house
       (4, 25);

/*
     Вывести наименование районов, где code города = мск, где есть дома с кол-вом
     этажем менее 6
     И число таких домов на районе более одного
 */
-- вывести города с код mck
SELECT CITY.name as city_name FROM CITY WHERE code = 'mck';

-- Вывести наименование районов, где code города = мск,
SELECT CITY.code as city_code, DISTRICT.name as district_name FROM CITY
    LEFT JOIN DISTRICT on CITY.id = DISTRICT.city_id
    WHERE CITY.code = 'mck';

-- Вывести наименование районов, где code города = мск, где есть дома с кол-вом этажем менее 6

/*SELECT CITY.code as city_name, DISTRICT.name as district_name, HOUSE.number_of_floors as number_of_floors
FROM CITY
    LEFT JOIN DISTRICT ON CITY.id = DISTRICT.city_id
    LEFT JOIN HOUSE ON DISTRICT.id = HOUSE.district_id
WHERE number_of_floors < 6 AND count(CITY.name);*/




