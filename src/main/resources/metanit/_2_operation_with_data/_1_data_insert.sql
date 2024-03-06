CREATE TABLE Products
(
      Id SERIAL PRIMARY KEY,
      ProductName VARCHAR(30) NOT NULL,
      Manufacturer VARCHAR(20) NOT NULL,
      ProductCount INTEGER DEFAULT 0,
      Price NUMERIC
);

/* Добавим в нее одну строку с помощью команды INSERT: */
INSERT INTO Products VALUES (1, 'Galaxy S9', 'Samsung', 4, 63000)

/* Также при вводе значений можно указать непосредственные столбцы,
   в которые будут добавляться значения:*/

INSERT INTO Products (ProductName, Price, Manufacturer)
VALUES ('iPhone X', 71000, 'Apple');

/* */

INSERT INTO Products
(ProductName, Manufacturer, ProductCount, Price)
VALUES('Desire 12', 'HTC', 8, 21000) RETURNING id;