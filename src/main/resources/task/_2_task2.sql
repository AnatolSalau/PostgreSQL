/*
  1. Создать две таблицы с отношением 1 к 1
 */
CREATE TABLE IF NOT EXISTS people
(
      id           BIGSERIAL UNIQUE PRIMARY KEY,
      name         varchar(128),
      telephone_id BIGINT UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS telephone
(
      id        BIGSERIAL UNIQUE PRIMARY KEY,
      number varchar(128)
);

ALTER TABLE people
ADD FOREIGN KEY (telephone_id) REFERENCES telephone (id);

INSERT INTO telephone (number) VALUES
                                      ('375331111111'),
                                      ('375332222222'),
                                      ('375333333333'),
                                      ('375334444444'),
                                      ('375335555555');

INSERT INTO people (name, telephone_id) VALUES
('user1', 1),
('user1', 2),
('user1', 3),
('user1', 4),
('user1', 5);

--UPDATE people SET telephone_id = 4 WHERE telephone_id = 5;

/*
  2.  Вложенные транзакции - видимость
 */
-- выберем две таблицы
SELECT name, number FROM people
      INNER JOIN telephone  on telephone.id = people.telephone_id;

-- добавим пользователей и телефоны с помощью транзакции

BEGIN;
SAVEPOINT add_telephones;
INSERT INTO telephone (number) VALUES
                                     ('375336666666'),
                                     ('375337777777');
      SELECT name AS names_before_transaction, number AS numbers_before_transaction FROM people
                               INNER JOIN telephone  on telephone.id = people.telephone_id;
      BEGIN;
            SAVEPOINT add_peoples;
            SELECT name AS names_before_inner_transaction, number AS numbers_before_inner_transaction FROM people
                                                                                       INNER JOIN telephone  on telephone.id = people.telephone_id;
            INSERT INTO people (name, telephone_id) VALUES
                                              ('user1', 6),
                                              ('user1', 7);
            SELECT name AS names_after_inner_transaction, number AS numbers_after_inner_transaction FROM people
                                                                                                     INNER JOIN telephone  on telephone.id = people.telephone_id;
            ROLLBACK TO add_peoples;

      SELECT name AS names_after_transaction, number AS numbers_after_transaction FROM people
                                                                                         INNER JOIN telephone  on telephone.id = people.telephone_id;
--ROLLBACK TO add_telephones;
COMMIT;
--прервать текущую транзакцию
ABORT TRANSACTION;

/*
   3. Создать две таблицы с отношением 1 к многим без обратной связи
*/

/*
   4. Создать две таблицы с отношением 1 к многим с обратной связью
*/

/*
   5. Создать две таблицы с отношением многие ко многим
*/
