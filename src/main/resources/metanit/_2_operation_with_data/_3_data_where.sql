CREATE TABLE Products
(
      Id SERIAL PRIMARY KEY,
      ProductName VARCHAR(30) NOT NULL,
      Manufacturer VARCHAR(20) NOT NULL,
      ProductCount INTEGER DEFAULT 0,
      Price NUMERIC
);

INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES
      ('iPhone X', 'Apple', 3, 36000),
      ('iPhone 8', 'Apple', 2, 41000),
      ('Galaxy S9', 'Samsung', 2, 46000),
      ('Galaxy S8 Plus', 'Samsung', 1, 56000),
      ('Desire 12', 'HTC', 5, 28000);

SELECT * FROM Products
WHERE Manufacturer = 'Apple';

SELECT * FROM Products
WHERE Price < 39000;

SELECT * FROM Products
WHERE Manufacturer = 'Samsung' AND Price > 50000;
SELECT * FROM Products
WHERE Manufacturer = 'Samsung' OR Price > 50000;
SELECT * FROM Products
WHERE NOT Manufacturer = 'Samsung';

/*Выберем все товары, у которых не установлено поле ProductCount:*/
SELECT * FROM Products
WHERE ProductCount IS NULL;