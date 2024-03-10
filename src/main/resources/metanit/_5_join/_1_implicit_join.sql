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

/* Для решения этой задачи необходимо использовать выражение WHERE и фильтровать строки при условии,
   что поле CustomerId из Orders соответствует полю Id из Customers: */

SELECT * FROM Orders, Customers
WHERE Orders.CustomerId = Customers.Id;

/* Теперь объединим данные по трем таблицам Orders, Customers и Proucts.
   То есть получим все заказы и добавим информацию по клиенту и связанному товару:
 */

SELECT Customers.FirstName, Products.ProductName, Orders.CreatedAt
FROM Orders, Customers, Products
WHERE Orders.CustomerId = Customers.Id AND Orders.ProductId=Products.Id;