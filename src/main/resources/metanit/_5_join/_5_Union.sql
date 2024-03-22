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

SELECT FirstName, LastName
FROM Customers
UNION SELECT FirstName, LastName FROM Employees;

-- объединение с дубликатами
SELECT FirstName, LastName
FROM Customers
UNION ALL SELECT FirstName, LastName FROM Employees;

-- склеим данные с колонок FirstName и LastName в одну
SELECT FirstName || ' ' || LastName AS FullName
FROM Customers;

--обьединение со склейкой данных

SELECT customers.firstname || ' ' || customers.lastname
FROM Customers
UNION SELECT employees.firstname || ' ' || employees.lastname
FROM Employees;

/*
      Сделать выборку из таблицы Customers
      вывести имя и фамилию и начислить проценты
            если сумма меньше 2800 -> начислить 50 процентов
            если сумма больше 2800 -> начислить 10 процентов
      Формула подсчета процентов:
            10 процентов:num + num * 0.1
            50 процентов:num + num * 0.5
 */

SELECT FirstName, LastName, AccountSum, AccountSum + AccountSum * 0.5 AS total_with_percent, (AccountSum + AccountSum * 0.5) - AccountSum AS percents
FROM Customers WHERE Customers.AccountSum < 2800
UNION ALL SELECT FirstName, LastName, AccountSum, AccountSum + AccountSum * 0.1 AS total_with_percent, (AccountSum + AccountSum * 0.1) - AccountSum AS percents
FROM Customers WHERE Customers.AccountSum >= 2800