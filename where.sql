CREATE TABLE data(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10,2)
);

INSERT INTO data(name, department, salary) VALUES
('Alice', 'HR', 50000),
('Bob', 'IT', 750000);

SELECT name, salary
FROM data
WHERE department = 'IT'; 


SELECT name , department, salary
FROM data WHERE salary > 6000;

SELECT DISTINCT department FROM data;

SELECT DISTINCT salary FROM data;

SELECT DISTINCT department FROM salary > 5000;