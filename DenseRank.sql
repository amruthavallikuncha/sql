
-- Using DENSE_RANK function
SELECT 
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank,
    id, 
    first_name, 
    last_name, 
    salary
FROM employees;
