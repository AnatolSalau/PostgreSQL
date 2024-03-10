create type request_state as enum ('created', 'approved', 'finshed');

/*
 Данное перечисление называется "request_state". После слова enum в скобках указывается через запятую список констант,
 которые составляют данное перечисление. То есть в данном случае перечисление
 request_status может принимать три значения: 'created', 'approved', 'finshed'.

После создания перечисления мы можем использовать его в качестве типа столбца. Например, создадим следующую таблицу:
 */

create table requests
(
    id     serial primary key,
    title  varchar(30),
    status request_state
);

insert into requests(title, status)
values ('Request 1', 'created');

/* Изменение перечисления */
ALTER TYPE request_state ADD VALUE 'blocked';

/* Удаление перечисления */
CREATE TYPE status_enum AS ENUM('created', 'approved', 'done');

ALTER TABLE requests ALTER COLUMN status TYPE status_enum
    USING status::text::status_enum;