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
/*
 Оператор DISTINCT позволяет выбрать уникальные данные по определенным столбцам.
 */
SELECT DISTINCT Manufacturer FROM Products;