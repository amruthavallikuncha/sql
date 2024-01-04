
-- Basic GROUP BY
SELECT department, AVG(salary) as avg_salary
FROM employees
GROUP BY department;

-- GROUP BY with HAVING
SELECT department, AVG(salary) as avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- GROUP BY with COUNT
SELECT department, COUNT(*) as employee_count
FROM employees
GROUP BY department;

-- GROUP BY with ORDER BY
SELECT department, AVG(salary) as avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- GROUP BY with multiple columns
SELECT department, age, AVG(salary) as avg_salary
FROM employees
GROUP BY department, age;
