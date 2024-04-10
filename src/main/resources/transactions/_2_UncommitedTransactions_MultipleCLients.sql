CREATE TABLE students (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(50),
                            age INT
);
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN;
      INSERT INTO students (name, age) VALUES ('Alice', 20);
      SELECT name, age AS age_before FROM students;


--COMMIT;

BEGIN;
SELECT name, age AS age_after FROM students;
INSERT INTO students (name, age) VALUES ('Bob', 30);
COMMIT;

--change name in session 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN;
UPDATE students SET name = 'Alice5' WHERE name = 'Alice4'