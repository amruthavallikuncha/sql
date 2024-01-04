-- Creating a sample table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);

-- Inserting data into the table
INSERT INTO employees (id, first_name, last_name, age, salary, department)
VALUES (1, 'John', 'Doe', 30, 50000.00, 'IT'),
       (2, 'Alice', 'Smith', 25, 60000.00, 'Finance'),
       (3, 'Bob', 'Johnson', 35, 75000.00, 'HR'),
       (4, 'Charlie', 'Brown', 28, 55000.00, 'IT');

-- Basic SELECT query
SELECT * FROM employees;

-- Filtering rows with WHERE clause
SELECT * FROM employees WHERE age > 30;

-- Ordering results with ORDER BY
SELECT * FROM employees ORDER BY salary DESC;

-- Aggregating data with GROUP BY and aggregate functions
SELECT department, AVG(salary) as avg_salary, COUNT(*) as employee_count
FROM employees
GROUP BY department;

-- JOIN operations
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO departments (id, name)
VALUES (1, 'IT'),
       (2, 'Finance'),
       (3, 'HR');

-- INNER JOIN
SELECT employees.id, employees.first_name, employees.last_name, departments.name as department
FROM employees
INNER JOIN departments ON employees.department = departments.name;

-- LEFT JOIN
SELECT employees.id, employees.first_name, employees.last_name, departments.name as department
FROM employees
LEFT JOIN departments ON employees.department = departments.name;

-- Subqueries
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Updating records
UPDATE employees
SET salary = salary * 1.1
WHERE department = 'IT';

-- Deleting records
DELETE FROM employees
WHERE age < 25;

-- Creating an index
CREATE INDEX idx_age ON employees(age);

-- Transactions
BEGIN TRANSACTION;
UPDATE employees SET salary = salary * 1.05 WHERE department = 'Finance';
UPDATE employees SET salary = salary * 1.08 WHERE department = 'IT';
COMMIT;

-- Views
CREATE VIEW high_salary_employees AS
SELECT * FROM employees WHERE salary > 70000.00;

-- Stored procedures
DELIMITER //
CREATE PROCEDURE get_employee_count()
BEGIN
    SELECT COUNT(*) FROM employees;
END //
DELIMITER ;

-- Triggers
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.salary = NEW.salary * 1.03;
