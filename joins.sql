
-- INNER JOIN
SELECT employees.id, employees.first_name, employees.last_name, departments.name as department
FROM employees
INNER JOIN departments ON employees.department = departments.name;

-- LEFT JOIN
SELECT employees.id, employees.first_name, employees.last_name, departments.name as department
FROM employees
LEFT JOIN departments ON employees.department = departments.name;

-- Subquery with JOIN
SELECT employees.first_name, employees.last_name, employees.salary, departments.name as department
FROM employees
INNER JOIN (
    SELECT department, AVG(salary) as avg_salary
    FROM employees
    GROUP BY department
) as department_avg ON employees.department = department_avg.department
WHERE employees.salary > department_avg.avg_salary;
