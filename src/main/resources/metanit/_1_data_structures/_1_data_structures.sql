/*Создание базы данных*/
CREATE DATABASE  users;
/*Удаление базы данных*/
DROP DATABASE users;

/*Создание таблицы customers*/
CREATE TABLE customers
(
      Id SERIAL PRIMARY KEY,
      FirstName CHARACTER VARYING(30),
      LastName CHARACTER VARYING(30),
      Email CHARACTER VARYING(30),
      Age INTEGER
);

/*Создание таблицы customers2*/
CREATE TABLE customers2
(
      Id SERIAL PRIMARY KEY,
      FirstName CHARACTER VARYING(30),
      LastName CHARACTER VARYING(30),
      Email CHARACTER VARYING(30),
      Age INTEGER
);
/*Удаление таблиц  customers customers2*/

DROP TABLE IF EXISTS  customers2;

