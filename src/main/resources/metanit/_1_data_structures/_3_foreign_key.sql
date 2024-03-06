/* Создадим две таблицы с ограничением на уровне столбца*/
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      Age INTEGER,
      FirstName VARCHAR(20) NOT NULL
);

CREATE TABLE Orders
(
      Id SERIAL PRIMARY KEY,
      CustomerId INTEGER REFERENCES Customers (Id),
      Quantity INTEGER
);

/* Определение внешнего ключа на уровне таблицы выглядело бы следующим образом:*/
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      Age INTEGER,
      FirstName VARCHAR(20) NOT NULL
);

CREATE TABLE Orders
(
      Id SERIAL PRIMARY KEY,
      CustomerId INTEGER,
      Quantity INTEGER,
      FOREIGN KEY (CustomerId) REFERENCES Customers (Id)
);
