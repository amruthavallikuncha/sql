
-- Concatenating strings with CONCAT
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- Using COALESCE to handle NULL values
SELECT first_name, COALESCE(last_name, 'N/A') AS last_name
FROM employees;

-- Using CASE statement for conditional logic
SELECT 
    id,
    first_name,
    last_name,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age >= 25 AND age < 35 THEN 'Adult'
        ELSE 'Senior'
    END AS age_category
FROM employees;

-- Pivot table using CASE and GROUP BY
SELECT
    department,
    COUNT(CASE WHEN age < 30 THEN 1 END) AS count_age_lt_30,
    COUNT(CASE WHEN age >= 30 AND age < 40 THEN 1 END) AS count_age_30_to_39,
    COUNT(CASE WHEN age >= 40 THEN 1 END) AS count_age_gte_40
FROM employees
GROUP BY department;

-- Finding duplicates using GROUP BY and HAVING
SELECT first_name, last_name, COUNT(*) AS count
FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- Window functions for running totals
SELECT 
    id,
    salary,
    SUM(salary) OVER (ORDER BY id) AS running_total
FROM employees;

-- Self-join to find employees with the same department
SELECT 
    e1.id AS employee1_id,
    e1.first_name AS employee1_first_name,
    e1.last_name AS employee1_last_name,
    e2.id AS employee2_id,
    e2.first_name AS employee2_first_name,
    e2.last_name AS employee2_last_name
FROM employees e1
JOIN employees e2 ON e1.department = e2.department AND e1.id < e2.id;

-- Using EXISTS to check for existence
SELECT 
    id,
    first_name,
    last_name
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e2.department = 'IT' AND e1.id = e2.id
);

-- Using LIMIT to get top N records
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
