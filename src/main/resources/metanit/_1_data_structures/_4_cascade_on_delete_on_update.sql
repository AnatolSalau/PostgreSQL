/*
 ON DELETE и ON UPDATE
С помощью выражений ON DELETE и ON UPDATE можно установить действия,
 которые выполняются соответственно при удалении и изменении связанной строки из главной таблицы.
 Для установки подобного действия можно использовать следующие опции:

CASCADE: автоматически удаляет или изменяет строки из зависимой таблицы
 при удалении или изменении связанных строк в главной таблице.

RESTRICT: предотвращает какие-либо действия в зависимой таблице при удалении
 или изменении связанных строк в главной таблице. То есть фактически какие-либо действия отсутствуют.

NO ACTION: действие по умолчанию, предотвращает какие-либо действия в зависимой таблице
 при удалении или изменении связанных строк в главной таблице. И генерирует ошибку.
 В отличие от RESTRICT выполняет отложенную проверку на связанность между таблицами.

SET NULL: при удалении связанной строки из главной таблицы устанавливает для столбца
 внешнего ключа значение NULL.

SET DEFAULT: при удалении связанной строки из главной таблицы
 устанавливает для столбца внешнего ключа значение по умолчанию,
 которое задается с помощью атрибуты DEFAULT. Если для столбца не задано значение по умолчанию,
 то в качестве него применяется значение NULL.
 */
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      Age INTEGER,
      FirstName VARCHAR(20) NOT NULL
);

/*CREATE TABLE Orders
(
      Id SERIAL PRIMARY KEY,
      CustomerId INTEGER,
      Quantity INTEGER,
      FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE CASCADE
);*/

CREATE TABLE Orders
(
      Id SERIAL PRIMARY KEY,
      CustomerId INTEGER,
      Quantity INTEGER,
      FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE RESTRICT
);

INSERT INTO Customers (Age, FirstName)
VALUES (18, 'Customer1'),
       (19, 'Customer2'),
       (19, 'Customer3'),
       (20, 'Customer4');

INSERT INTO Orders (CustomerId, Quantity)
VALUES (1, 10),
       (2, 10),
       (1, 20),
       (2, 20);

/* Select all customers name for all orders */
SELECT Customers.Id AS customer_id, Customers.FirstName AS customer_name,Orders.Id AS order_id, Orders.Quantity AS order_quantity
FROM Orders
      RIGHT JOIN Customers On Orders.CustomerId = Customers.Id;

/*
Delete Customer1 with Delete Type -> Cascade

1,Customer1,1,10
2,Customer2,2,10
1,Customer1,3,20
2,Customer2,4,20
4,Customer4,,
3,Customer3,,

*/
DELETE FROM Customers WHERE Customers.FirstName = 'Customer1';

/* Delete Customer1 with Delete Type -> Restrict*/

DELETE FROM Customers WHERE Customers.FirstName = 'Customer1';
-- - > ОШИБКА: UPDATE или DELETE в таблице "customers" нарушает ограничение внешнего ключа "orders_customerid_fkey" таблицы "orders

UPDATE Orders
SET CustomerId = NULL
WHERE CustomerId = 1;

DELETE FROM Customers WHERE Customers.Id = 1;



