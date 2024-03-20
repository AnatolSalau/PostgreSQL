CREATE TABLE Products
(
    Id SERIAL PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Company VARCHAR(20) NOT NULL,
    ProductCount INTEGER DEFAULT 0,
    Price NUMERIC NOT NULL
);
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL
);
CREATE TABLE Orders
(
    Id SERIAL PRIMARY KEY,
    ProductId INTEGER NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
    CustomerId INTEGER NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
    CreatedAt DATE NOT NULL,
    ProductCount INTEGER DEFAULT 1,
    Price NUMERIC NOT NULL
);

INSERT INTO Products(ProductName, Company, ProductCount, Price)
VALUES ('iPhone X', 'Apple', 2, 66000),
       ('iPhone 8', 'Apple', 2, 51000),
       ('iPhone 7', 'Apple', 5, 42000),
       ('Galaxy S9', 'Samsung', 2, 56000),
       ('Galaxy S8 Plus', 'Samsung', 1, 46000),
       ('Nokia 9', 'HDM Global', 2, 26000),
       ('Desire 12', 'HTC', 6, 38000);

INSERT INTO Customers(FirstName)
VALUES ('Tom'), ('Bob'),('Sam');

INSERT INTO Orders(ProductId, CustomerId, CreatedAt, ProductCount, Price)
VALUES
    (
        (SELECT Id FROM Products WHERE ProductName='Galaxy S9'),
        (SELECT Id FROM Customers WHERE FirstName='Tom'),
        '2017-07-11',
        2,
        (SELECT Price FROM Products WHERE ProductName='Galaxy S9')
    ),
    (
        (SELECT Id FROM Products WHERE ProductName='iPhone 8'),
        (SELECT Id FROM Customers WHERE FirstName='Tom'),
        '2017-07-13',
        1,
        (SELECT Price FROM Products WHERE ProductName='iPhone 8')
    ),
    (
        (SELECT Id FROM Products WHERE ProductName='iPhone 8'),
        (SELECT Id FROM Customers WHERE FirstName='Bob'),
        '2017-07-11',
        1,
        (SELECT Price FROM Products WHERE ProductName='iPhone 8')
    );

/* Используя JOIN, выберем все заказы и добавим к ним информацию о товарах: */

SELECT Orders.CreatedAt, Orders.ProductCount, Products.ProductName
FROM Orders
         JOIN Products ON Products.Id = Orders.ProductId;
/* Подобным образом мы можем присоединять и другие таблицы.
   Например, добавим к заказу информацию о покупателе из таблицы Customers: */
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName
FROM Orders
         JOIN Products ON Products.Id = Orders.ProductId
         JOIN Customers ON Customers.Id=Orders.CustomerId;

-- выводим все заказы для покупателей
SELECT Customers.FirstName, Orders.ProductId, Orders.Price
FROM Customers
      JOIN Orders ON Customers.Id = Orders.CustomerId;

-- выведим все товары (их имя и цена) связанные с заказами (количество товаров)
SELECT Products.ProductName AS product_name,Orders.Price AS price,  Orders.ProductCount AS count
FROM Products
      JOIN Orders ON Products.Id = Orders.ProductId;

--отсортируем по цене
SELECT Products.ProductName AS product_name,Products.Price AS price,  Orders.ProductCount AS count
FROM Products
           JOIN Orders ON Products.Id = Orders.ProductId
ORDER BY Products.Price;