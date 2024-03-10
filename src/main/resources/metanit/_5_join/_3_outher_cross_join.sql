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

/* И соединим таблицы Orders и Customers:*/
/*
 Таблица Orders является первой или левой таблицей, а таблица Customers - правой таблицей.
 Поэтому, так как здесь используется выборка по левой таблице, то вначале будут выбираться все строки из Orders,
 а затем к ним по условию Orders.CustomerId = Customers.Id будут добавляться связанные строки из Customers.
 */
SELECT FirstName, CreatedAt, ProductCount, Price, ProductId
FROM Orders LEFT JOIN Customers
                      ON Orders.CustomerId = Customers.Id;

-- INNER JOIN
SELECT FirstName, CreatedAt, ProductCount, Price
FROM Customers JOIN Orders
                    ON Orders.CustomerId = Customers.Id;

--LEFT JOIN
SELECT FirstName, CreatedAt, ProductCount, Price
FROM Customers LEFT JOIN Orders
                         ON Orders.CustomerId = Customers.Id;

--Изменим в примере выше тип соединения на правостороннее:
SELECT FirstName, CreatedAt, ProductCount, Price, ProductId
FROM Orders RIGHT JOIN Customers
                       ON Orders.CustomerId = Customers.Id;

--Полное соединение (FULL JOIN) объединяет обе таблицы:
SELECT FirstName, CreatedAt, ProductCount, Price, ProductId
FROM Orders FULL JOIN Customers
                      ON Orders.CustomerId = Customers.Id;

/*
 Cross Join или перекрестное соединение создает набор строк,
 где каждая строка из одной таблицы соединяется с каждой строкой из второй таблицы.
 Например, соединим таблицу заказов Orders и таблицу покупателей Customers:
 */

SELECT * FROM Orders CROSS JOIN Customers;