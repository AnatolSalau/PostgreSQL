CREATE TABLE Products
(
      Id SERIAL PRIMARY KEY,
      ProductName VARCHAR(30) NOT NULL,
      Manufacturer VARCHAR(20) NOT NULL,
      ProductCount INTEGER DEFAULT 0,
      Price NUMERIC
);
INSERT INTO Products  (ProductName, Manufacturer, ProductCount, Price)
VALUES
      ('iPhone X', 'Apple', 2, 71000),
      ('iPhone 8', 'Apple', 3, 56000),
      ('Galaxy S9', 'Samsung', 6, 56000),
      ('Galaxy S8 Plus', 'Samsung', 2, 46000),
      ('Desire 12', 'HTC', 3, 26000);

/* Оператор LIMIT позволяет извлечь определенное количество строк: */
SELECT * FROM Products
ORDER BY ProductName
LIMIT 4;

/* Оператор OFFSET позволяет указать, с какой строки надо начинать выборку.
   Например, выберем 3 строки, начиная со 2-й:*/

SELECT * FROM Products
ORDER BY ProductName
LIMIT 3 OFFSET 2;


