CREATE TABLE students (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(50),
                            age INT
);

BEGIN;
      INSERT INTO students (name, age) VALUES ('Alice', 20);
      SELECT name, age AS age_before FROM students;
      BEGIN;
            SELECT name, age AS age_after FROM students;
            INSERT INTO students (name, age) VALUES ('Bob', 30);
      COMMIT;
COMMIT;