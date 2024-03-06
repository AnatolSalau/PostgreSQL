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

/*Получим все объекты из этой таблицы:*/
SELECT * FROM Products;
/* */
SELECT ProductName, Price FROM Products;

/* Выборка данных с переименованием столбцов*/
SELECT ProductCount AS Title,
       Manufacturer,
       Price * ProductCount  AS TotalSum
FROM Products;