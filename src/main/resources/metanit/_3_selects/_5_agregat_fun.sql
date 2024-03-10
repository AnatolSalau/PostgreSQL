/*
    AVG: находит среднее значение. Входной параметр должен представлять один из следующих типов: smallint, int, bigint, real, double precision, numeric, interval. Для целочисленнных параметров результатом будет значение типа numeric, для параметров, которые представляют число с плавающей точкой, - значение типа double precision.

    BIT_AND: выполняет операцию побитового умножения (операции логического И) для чисел следующих типов: smallint, int, bigint, bit. Если параметр содержит значение NULL, то возвращается NULL.

    BIT_OR: выполняет операцию побитового сложения (операции логического ИЛИ) для чисел следующих типов: smallint, int, bigint, bit. Если параметр содержит значение NULL, то возвращается NULL.

    BOOL_AND: выполняет операцию логического умножения для значений типа bool. Если входные все значения равны true, то возвращается true, иначе возвращается false.

    BOOL_OR: выполняет операцию логического сложения для значений типа bool. Если входные хотя бы одно из значений равно true, то возвращается true, иначе возвращается false.

    COUNT(*): находит количество строк в запросе

    COUNT(expression): находит количество строк в запросе, для которых expression не содержит значение NULL.

    SUM: находит сумму значений

    MIN: находит наименьшее значение

    MAX: находит наибольшее значение

    STRING_AGG(expression, delimiter): соединяет с помощью delimiter все текстовые значения из expression в одну строку.
 */
CREATE TABLE Products
(
    Id SERIAL PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Company VARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price NUMERIC NOT NULL,
    IsDiscounted BOOL
);

INSERT INTO Products (ProductName, Company, ProductCount, Price, IsDiscounted)
VALUES
    ('iPhone X', 'Apple', 3, 76000, false),
    ('iPhone 8', 'Apple', 2, 71000, true),
    ('iPhone 7', 'Apple', 5, 42000, true),
    ('Galaxy S9', 'Samsung', 2, 46000, false),
    ('Galaxy S8 Plus', 'Samsung', 1, 56000, true),
    ('Desire 12', 'HTC', 5, 28000, true),
    ('Nokia 9', 'HMD Global', 6, 38000, true);

SELECT AVG(Price) AS Average_Price FROM Products;

SELECT COUNT(DISTINCT Company) FROM Products;

SELECT MAX(Price) FROM Products;

SELECT SUM(ProductCount) FROM Products;

/*Объединим применение нескольких функций:*/
SELECT COUNT(*) AS ProdCount,
       SUM(ProductCount) AS TotalCount,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice,
       AVG(Price) AS AvgPrice
FROM Products;