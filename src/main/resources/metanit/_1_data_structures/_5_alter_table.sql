CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      Age INTEGER,
      FirstName VARCHAR(20) NOT NULL
);

/*Добавление нового столбца*/
ALTER TABLE Customers
      ADD Phone CHARACTER VARYING(20) NULL;

/*Удаление столбца*/
ALTER TABLE Customers
      DROP COLUMN FirstName;

/*
 Изменение типа столбца
Для изменения типа применяется ключевое слово TYPE.
 Изменим в таблице Customers тип данных у столбца FirstName на VARCHAR(50)
 (он же VARYING CHARACTER(50)):
 */
ALTER TABLE Customers
      ALTER COLUMN FirstName TYPE VARCHAR(50);

/*Изменение ограничений столбца*/
ALTER TABLE Customers
      ALTER COLUMN FirstName
            SET NOT NULL;

/*Удаление ограничений столбца*/
ALTER TABLE Customers
      ALTER COLUMN FirstName
            DROP NOT NULL;

/*Добавление первичного ключа PRIMARY KEY: */
ALTER TABLE Customers
      ADD PRIMARY KEY (Id);

/*Переименование столбца и таблицы */
ALTER TABLE Customers
      RENAME COLUMN Age TO NewAge;

ALTER TABLE Customers
      RENAME TO Users;