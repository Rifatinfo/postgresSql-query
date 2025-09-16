### PostgresSql 

---

## Alter 

In PostgreSQL, the ALTER TABLE statement is a powerful and essential tool that allows us to modify the structure of an existing table to meet evolving database needs. With PostgreSQL ALTER TABLE, we can perform various modifications on the table without disrupting the ongoing operations of our database.

---

# Adding a New Column

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