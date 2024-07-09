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
       (3, 'district_3'),-- right house with flors < 5
       (4, 'district_4');



INSERT INTO HOUSE (district_id, number_of_floors)
VALUES (1, 5),
       (1, 5),
       (2, 5),
       (2, 5),
       (3, 5), -- right house with flors < 5
       (4, 25);

/*
 Вывести наименование районов, где code города = мск, где есть дома с кол-вом
 этажем менее 6
 И число таких домов на районе более одного
 */
SELECT CITY.code, DISTRICT.name, HOUSE.number_of_floors FROM HOUSE
    LEFT JOIN DISTRICT on DISTRICT.id = HOUSE.id
    LEFT JOIN CITY on CITY.id = DISTRICT.id
WHERE CITY.code = 'mck'

;
/*
   1. Сгруппировать и посчитать количество домов с этажами меньше 5 в каждом районе
   2. Добавить условие где CITY.code = 'mck'
 */
SELECT DISTRICT.name, CITY.code, count(number_of_floors)
FROM DISTRICT
    LEFT JOIN HOUSE ON DISTRICT.id = HOUSE.district_id
    LEFT JOIN CITY ON DISTRICT.city_id = CITY.id
WHERE CITY.code = 'mck'
GROUP BY DISTRICT.name, CITY.code;






