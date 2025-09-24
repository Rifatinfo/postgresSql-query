# PostgresSql 

---

## Alter 

In PostgreSQL, the ALTER TABLE statement is a powerful and essential tool that allows us to modify the structure of an existing table to meet evolving database needs. With PostgreSQL ALTER TABLE, we can perform various modifications on the table without disrupting the ongoing operations of our database.

---

## Adding a New Column

To add a new column to an existing table, use the 'ADD COLUMN' action. This is particularly useful when we need to store additional data in our table.

```
ALTER TABLE table_name 
ADD COLUMN new_column_name TYPE;

```

1. Add a simple column

```
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10,2)
);

ALTER TABLE employees
ADD COLUMN department VARCHAR(100);

```
Now the table has: id, name, salary, department

---

2. Add column with default value

```
ALTER TABLE employees
ADD COLUMN hire_date DATE DEFAULT CURRENT_DATE;

```

3. Add column with NOT NULL

```
ALTER TABLE  employees
ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'active'

```

4. Add multiple columns at once

```
ALTER TABLE employees
ADD COLUMN email VARCHAR(40),
ADD COLUMN phone VARCHAR(40);

```

5. Add a column with foreign key

```
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);

ALTER TABLE employees
ADD COLUMN department_id INT REFERENCES departments(id);

```

6. Fill existing rows after adding column

When you add a column, old rows will have NULL unless you set a default.

```
UPDATE employees
SET department = 'General'
WHERE department IS NULL;

```

## Dropping a Column 

```
ALTER TABLE table_name
DROP COLUMN column_name [CASCADE | RESTRICT];

```

## Drop a simple column

```
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10,2),
    department VARCHAR(50)
);

```

```
ALTER TABLE employees
DROP COLUMN department;
```
1. Drop multiple columns at once

```
ALTER TABLE employeeinfo
 DROP COLUMN salary,
 DROP COLUMN name;

```

2. Drop column with dependent objects

If a column has dependencies (like foreign keys, views, or constraints), PostgreSQL will prevent dropping it by default. You can use CASCADE to remove dependencies automatically:

```
 ALTER TABLE employeeinfo
 DROP COLUMN department_id  CASCADE;
```

3. Drop column safely with RESTRICT

- If the column is used elsewhere (like in a foreign key), PostgreSQL will stop the operation
- This is safer when you want to avoid accidentally breaking dependencies.

```
ALTER TABLE employees
DROP COLUMN department_id RESTRICT

```

---

# Rename

```
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name

```

1. Rename a simple column 

```
CREATE TABLE renametable(
  id SERIAL PRIMARY key,
  full_name VARCHAR(100),
  salary NUMERIC(10,2)
)

ALTER TABLE renametable
Rename COLUMN full_name TO name;

```

---

## Changing the Default Value of a Column 

```
CREATE TABLE defaultCheck(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    status VARCHAR(20) DEFAULT 'active'
);

ALTER TABLE defaultCheck
ALTER COLUMN status SET DEFAULT 'pending'
```

1. Change numeric default 

```
ALTER TABLE renametable
ALTER COLUMN salary SET DEFAULT 2000;

```

2. Remove a default value 

```
ALTER TABLE defaultCheck
ALTER COLUMN status DROP DEFAULT;

```

3. Using function as default 

```
ALTER TABLE defaultCheck
ALTER COLUMN hire_date SET DEFAULT CURRENT_DATE;

ALTER TABLE defaultCheck
ALTER COLUMN hire_date SET DEFAULT NOW();
```

## Changing NOT NULL Constraint 

# A NOT NULL constraint ensures that a column cannot have NULL values.

```
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

```

---

## Adding a CHECK Constraint 

```
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

```

---

# Adding a General Constraint 

## Adding a primary key 

```
ALTER TABLE links
ADD CONSTRAINT link_id_pk PRIMARY KEY(link_id);

```

## Adding a unique constraint

```
ALTER TABLE links
ADD COLUMN email VARCHAR(200),
ADD CONSTRAINT users_email_unique UNIQUE (email);

```

## Adding a Foreign key

```
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL
);

````

```
CREATE TABLE links (
    id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    user_id INT
);

```

```
ALTER TABLE links
ADD CONSTRAINT orders_users_fk
FOREIGN KEY (user_id) REFERENCES users(id);

```

## Rename a table

```
ALTER TABLE links RENAME to user_links

``` 

---

# where use cse 

```
CREATE TABLE data(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10,2)
);

INSERT INTO data(name, department, salary) VALUES
('Alice', 'HR', 50000),
('Bob', 'IT', 750000);

```

```
SELECT name, salary
FROM data
WHERE department = 'IT'; 


SELECT name , department, salary
FROM data WHERE salary > 6000;

```
# Queries with DISTINCT 

```
SELECT DISTINCT department FROM data;

SELECT DISTINCT salary FROM data;

SELECT DISTINCT department FROM salary > 5000;
```

---
# UUID 
In PostgreSQL, uuid is a built-in data type used to store Universally Unique Identifiers (128-bit values). These are great for unique IDs that aren’t guessable or sequential like SERIAL/BIGSERIAL

```
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

INSERT INTO users (name, email)
VALUES ('Alice', 'alice@example.com'),
       ('Bob', 'bob@example.com');
```
```
SELECT * FROM users;

```
