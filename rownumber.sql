
-- Adding Row Numbers to the result set
SELECT 
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
    id, 
    first_name, 
    last_name, 
    salary
FROM employees;

-- Adding Row Numbers based on a partition
SELECT 
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num,
    id, 
    first_name, 
    last_name, 
    salary,
    department
FROM employees;

-- Using RANK function
SELECT 
    RANK() OVER (ORDER BY salary DESC) AS rank,
    id, 
    first_name, 
    last_name, 
    salary
FROM employees;

-- Using DENSE_RANK function
SELECT 
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank,
    id, 
    first_name, 
    last_name, 
    salary
FROM employees;
