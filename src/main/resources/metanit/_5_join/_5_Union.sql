CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    AccountSum NUMERIC DEFAULT 0
);
CREATE TABLE Employees
(
    Id SERIAL PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL
);

INSERT INTO Customers(FirstName, LastName, AccountSum) VALUES
                                                           ('Tom', 'Smith', 2000),
                                                           ('Sam', 'Brown', 3000),
                                                           ('Paul', 'Ins', 4200),
                                                           ('Victor', 'Baya', 2800),
                                                           ('Mark', 'Adams', 2500),
                                                           ('Tim', 'Cook', 2800);

INSERT INTO Employees(FirstName, LastName) VALUES
                                               ('Homer', 'Simpson'),
                                               ('Tom', 'Smith'),
                                               ('Mark', 'Adams'),
                                               ('Nick', 'Svensson');
/* Выберем сразу всех клиентов банка и его сотрудников из обеих таблиц: */
SELECT FirstName, LastName
FROM Customers
UNION SELECT FirstName, LastName FROM Employees;

/* Если же необходимо при объединении сохранить все, в том числе повторяющиеся строки, то для этого необходимо использовать оператор ALL: */
SELECT FirstName, LastName
FROM Customers
UNION ALL SELECT FirstName, LastName
FROM Employees;