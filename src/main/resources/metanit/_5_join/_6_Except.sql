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
/* нам надо найти всех клиентов банка, которые не являются его сотрудниками: */
SELECT FirstName, LastName
FROM Customers
EXCEPT SELECT FirstName, LastName
FROM Employees;
/* нам надо найти всех клиентов банка, которые не являются его сотрудниками: */
SELECT firstname || ' ' || lastname AS fullname
FROM Customers
EXCEPT SELECT firstname || ' ' || lastname
FROM Employees;
/* Подобным образом можно получить всех сотрудников банка, которые не являются его клиентами: */



