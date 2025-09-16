-- Active: 1748158278693@@localhost@5432@postgressql
CREATE DATABASE postgresSql;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10,2)
);

ALTER TABLE employees
ADD COLUMN department VARCHAR(100);

ALTER TABLE employees
ADD COLUMN hire_date DATE DEFAULT CURRENT_DATE;

ALTER TABLE  employees
ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'active' ;

ALTER TABLE employees
ADD COLUMN email VARCHAR(40),
ADD COLUMN phone VARCHAR(40);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);

ALTER TABLE employees
ADD COLUMN department_id INT REFERENCES departments(id); 


UPDATE employees
SET department = 'General'
WHERE department IS NULL;

