/*
      1. Create tables one to many
 */
CREATE TABLE IF NOT EXISTS employee_one_many
(
      id          bigserial primary key not null,
      name        varchar(256)          not null,
      age         integer               not null,
      position_id integer               not null
);

CREATE TABLE IF NOT EXISTS position_one_many
(
      id   bigserial primary key not null,
      name varchar(256)          not null
);

ALTER TABLE employee_one_many ADD CONSTRAINT "FK_position_id"
FOREIGN KEY ("position_id") REFERENCES position_one_many ("id");

INSERT INTO position_one_many (name) VALUES ('position1'), ('position2');

INSERT INTO employee_one_many (name, age, position_id)
VALUES ('name1', 18, 1),
       ('name2', 19, 2),
       ('name3', 20, 1),
       ('name4', 21, 2);

SELECT employee_one_many.name, position_one_many.name
FROM employee_one_many
      LEFT JOIN position_one_many ON employee_one_many.position_id = position_one_many.id
WHERE employee_one_many.name = 'name1';


