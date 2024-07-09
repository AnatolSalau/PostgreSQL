/*
      One to one
      Measurement (one) -> Value (one)
*/
create table measurement (
      id bigserial primary key,
      name varchar(128),
      value_id bigserial unique
);

create table value (
      id bigserial primary key,
      data float8
);

alter table measurement
      add constraint fk_value_id foreign key (value_id) references value (id);

INSERT INTO value (data) VALUES
      (1.1), (2.2), (3.3), (4.4), (5.5);

INSERT INTO measurement (name, value_id) VALUES
      ('one', 1), ('one', 2), ('one', 3), ('one', 4), ('one', 5);

SELECT name, data FROM measurement as meas
      JOIN value as val on meas.value_id = val.id;

/*
      One to one -> bidirectional

      Measurement (one) -> Value (one)
*/
