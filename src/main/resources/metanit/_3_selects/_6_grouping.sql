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


/* Например, сгруппируем товары по производителю */
SELECT Company, COUNT(*) AS ModelsCount
FROM Products
GROUP BY Company;

/* Следует учитывать, что выражение GROUP BY должно идти после выражения WHERE, но до выражения ORDER BY: */
SELECT Company, COUNT(*) AS ModelsCount
FROM Products
WHERE Price > 30000
GROUP BY Company
ORDER BY ModelsCount DESC;

/* Оператор HAVING указывает, какие группы будут включены в выходной результат, то есть выполняет фильтрацию групп.
   Его использование аналогично применению оператора WHERE.
 */
SELECT Company, COUNT(*) AS ModelsCount
FROM Products
WHERE Price * ProductCount > 80000
GROUP BY Company
HAVING COUNT(*) > 1;

--select all from Products
SELECT * FROM Products;

--select qty wit qty Product names
SELECT Company, count(ProductName) AS qty_products FROM Products
GROUP BY Company ;

--select company which have more than 1 product name
SELECT Company, count(ProductName) AS qty_products FROM Products
GROUP BY Company
HAVING count(ProductName) > 1;

--calculate sum Productcount in every company
SELECT Company, sum(ProductCount) As qty FROM Products
GROUP BY Company;

