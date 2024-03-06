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

SELECT * FROM Products
ORDER BY ProductCount;

/* Оператор ORDER BY позволяет отсортировать значения по определенному столбцу.
   Например, упорядочим выборку из таблицы Products по столбцу ProductCount:*/
SELECT * FROM Products
ORDER BY ProductCount;

/*Сортировка по убыванию */
SELECT ProductName, Manufacturer
FROM Products
ORDER BY Manufacturer DESC;

/*Сортировка по нескольким столбцам */
SELECT ProductName, Price, Manufacturer
FROM Products
ORDER BY Manufacturer ASC, ProductName DESC;