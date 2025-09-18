-- Active: 1748158278693@@localhost@5432@postgressql
CREATE DATABASE postgresSql;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10,2),

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


-- Drop column

CREATE TABLE employeeInfo (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  salary NUMERIC(10, 2),
  department VARCHAR(50)
)


ALTER TABLE employeeInfo
DROP COLUMN department;


-- multiple COLUMN
 ALTER TABLE employeeinfo
 DROP COLUMN salary,
 DROP COLUMN name;

ALTER TABLE employeeinfo
ADD COLUMN department_id INT REFERENCES departments(id); 


 ALTER TABLE employeeinfo
 DROP COLUMN department_id  CASCADE;

 ALTER TABLE employeeinfo
DROP COLUMN department_id RESTRICT;


--- Column Rename
CREATE TABLE renametable(
  id SERIAL PRIMARY key,
  full_name VARCHAR(100),
  salary NUMERIC(10,2)
)

ALTER TABLE renametable
Rename COLUMN full_name TO name;


-- not null
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100)
)

ALTER TABLE users
ALTER COLUMN email SET NOT  NULL;

UPDATE users
SET email = 'default@example'
WHERE email IS NULL;

ALTER TABLE users
ALTER COLUMN name DROP NOT NULL;


CREATE TABLE usercheck (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  age INT,
  CHECK (age >= 18)
)

ALTER TABLE usercheck
ADD CONSTRAINT check_age CHECK (age >= 18);


ALTER TABLE usercheck
ADD COLUMN salary NUMERIC(10,2) CHECK (salary > 0);