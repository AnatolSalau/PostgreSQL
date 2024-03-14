/*
      1. Create tables many to many
 */
CREATE TABLE IF NOT EXISTS employee
(
      id   bigserial primary key not null,
      name varchar(256)          not null,
      age  integer               not null
);

CREATE TABLE IF NOT EXISTS position
(
      id   bigserial primary key not null,
      name varchar(256)          not null
);

CREATE TABLE IF NOT EXISTS employee_position
(
      id          bigserial primary key not null,
      employee_id bigint                not null,
      position_id bigint                not null
);

ALTER TABLE employee_position
      ADD CONSTRAINT "FK_employee_id"
            FOREIGN KEY ("employee_id") REFERENCES "employee" ("id"),
      ADD CONSTRAINT "FK_position_id"
            FOREIGN KEY ("position_id") REFERENCES "position" ("id");
/*
      2. Insert data
 */
INSERT INTO employee (name, age)
VALUES ('name1', 18),
       ('name2', 19),
       ('name3', 20),
       ('name4', 19),
       ('name5', 18);

INSERT INTO position (name)
VALUES ('position1'),
       ('position2'),
       ('position3');

INSERT INTO employee_position (employee_id, position_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 1),
       (5, 2);

/*
      select all employee
 */

SELECT employee.name AS employee_name, employee.age AS employee_age, position.name AS position_name
FROM employee
LEFT JOIN employee_position ON employee.id = employee_position.employee_id
LEFT JOIN position ON employee_position.position_id = position.id;

/*
      select all employee with position 1
 */
SELECT employee.name AS employee_name, employee.age AS employee_age, position.name AS position_name
FROM employee
           LEFT JOIN employee_position ON employee.id = employee_position.employee_id
           LEFT JOIN position ON employee_position.position_id = position.id
WHERE position.name = 'position1';

/*
      2. Create table person - bank many to many
 */

CREATE TABLE person
(
      id        SERIAL PRIMARY KEY,
      full_name VARCHAR
);

CREATE TABLE bank
(
      id   SERIAL PRIMARY KEY,
      name VARCHAR
);

CREATE TABLE person_bank
(
      id        BIGSERIAL PRIMARY KEY,
      person_id INTEGER NOT NULL REFERENCES person,
      bank_id   INTEGER NOT NULL REFERENCES bank,
      UNIQUE (person_id, bank_id)
);
