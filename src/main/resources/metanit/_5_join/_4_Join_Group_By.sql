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

SELECT FirstName, COUNT(Orders.Id)
FROM Customers JOIN Orders
                    ON Orders.CustomerId = Customers.Id
GROUP BY Customers.Id, Customers.FirstName;

--выведим количество продуктов для каждого id
SELECT ProductId, count(ProductCount) FROM Orders GROUP BY ProductId;

--добавим название продукта
SELECT Products.ProductName, count(Orders.ProductCount)
FROM Products
      JOIN Orders ON Products.Id = Orders.ProductId
GROUP BY Products.ProductName;

--Например, выведем для каждого покупателя количество заказов, которые он сделал:
SELECT Customers.FirstName, count(Orders.ProductCount), Products.ProductName
FROM Customers
      LEFT JOIN Orders ON Customers.Id = Orders.CustomerId
      LEFT JOIN Products ON Orders.ProductId = Products.Id
GROUP BY Customers.FirstName, Products.ProductName;



