/*создать таблицу с составным ключом */
CREATE TABLE order_lines
(
      OrderId   INTEGER,
      ProductId INTEGER,
      Quantity  INTEGER,
      Price     MONEY,
      PRIMARY KEY (OrderId, ProductId)
);

/*уникальное значение в одном столбце*/
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      FirstName CHARACTER VARYING(20),
      LastName CHARACTER VARYING(20),
      Email CHARACTER VARYING(30) UNIQUE,
      Phone CHARACTER VARYING(30) UNIQUE,
      Age INTEGER
);

/* уникальное значение из двух значений в одной строке */
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      FirstName CHARACTER VARYING(20),
      LastName CHARACTER VARYING(20),
      Email CHARACTER VARYING(30),
      Phone CHARACTER VARYING(30),
      Age INTEGER,
      UNIQUE(Email, Phone)
);

/* null и not null*/
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      FirstName CHARACTER VARYING(20) NOT NULL,
      LastName CHARACTER VARYING(20) NOT NULL,
      Age INTEGER
);

/* значение по умолчанию*/
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      FirstName CHARACTER VARYING(20),
      LastName CHARACTER VARYING(20),
      Age INTEGER DEFAULT 18
);

/*CHECK задает ограничение для диапазона значений, которые могут храниться в столбце */
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      FirstName CHARACTER VARYING(20),
      LastName CHARACTER VARYING(20),
      Age INTEGER DEFAULT 18 CHECK(Age >0 AND Age < 100),
      Email CHARACTER VARYING(30) UNIQUE CHECK(Email !=''),
      Phone CHARACTER VARYING(20) UNIQUE CHECK(Phone !='')
);

/* Ограничение в целом для таблицы: */
CREATE TABLE Customers
(
      Id SERIAL PRIMARY KEY,
      Age INTEGER DEFAULT 18,
      FirstName CHARACTER VARYING(20),
      LastName CHARACTER VARYING(20),
      Email CHARACTER VARYING(30) UNIQUE,
      Phone CHARACTER VARYING(20) UNIQUE,
      CHECK((Age >0 AND Age<100) AND (Email !='') AND (Phone !=''))
);

/* Ограничения */
CREATE TABLE Customers
(
      Id SERIAL CONSTRAINT customer_Id PRIMARY KEY,
      Age INTEGER CONSTRAINT customers_age_check CHECK(Age >0 AND Age < 100),
      FirstName CHARACTER VARYING(20) NOT NULL,
      LastName CHARACTER VARYING(20) NOT NULL,
      Email CHARACTER VARYING(30) CONSTRAINT customers_email_key UNIQUE,
      Phone CHARACTER VARYING(20) CONSTRAINT customers_phone_key UNIQUE
);

CREATE TABLE Customers
(
      Id SERIAL,
      Age INTEGER,
      FirstName CHARACTER VARYING(20) NOT NULL,
      LastName CHARACTER VARYING(20) NOT NULL,
      Email CHARACTER VARYING(30),
      Phone CHARACTER VARYING(20),
      CONSTRAINT customer_Id PRIMARY KEY(Id),
      CONSTRAINT customers_age_check CHECK(Age >0 AND Age < 100),
      CONSTRAINT customers_email_key UNIQUE(Email),
      CONSTRAINT customers_phone_key UNIQUE(Phone)
);

