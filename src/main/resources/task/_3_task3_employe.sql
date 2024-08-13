CREATE TABLE departments (
                             department_id SERIAL PRIMARY KEY,
                             department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
                           employee_id SERIAL PRIMARY KEY,
                           employee_name VARCHAR(100) NOT NULL,
                           department_id INTEGER REFERENCES departments(department_id)
);

INSERT INTO departments (department_name) VALUES
                                              ('HR'),
                                              ('IT'),
                                              ('Finance'),
                                              ('Marketing');

INSERT INTO employees (employee_name, department_id) VALUES
                                                         ('John Doe', 1),
                                                         ('Jane Smith', 1),
                                                         ('Jim Brown', 2),
                                                         ('Jake White', 2),
                                                         ('Jill Green', 2),
                                                         ('Jack Black', 3);

--Задача: Вывести названия отделов, где не более 3 сотрудников

SELECT department_name, COUNT(*)
    FROM departments
    JOIN employees  ON departments.department_id = employees.department_id
    GROUP BY department_name
    HAVING COUNT(department_name) <= 1;

