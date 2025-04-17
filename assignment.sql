                   --Team Members: [KALISA INEZA Jovith] & [NKURUNZIZA Salomon] 

-- Dataset: Employees
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    joining_date DATE,
    region VARCHAR(50)
);

-- Sample Data
INSERT INTO employees VALUES
(1, 'Alice', 'HR', 50000, '2020-01-15', 'East'),
(2, 'Bob', 'IT', 70000, '2019-03-10', 'West'),
(3, 'Charlie', 'HR', 52000, '2021-07-23', 'East'),
(4, 'David', 'IT', 73000, '2018-11-05', 'West'),
(5, 'Eve', 'Sales', 60000, '2019-12-01', 'North'),
(6, 'Frank', 'Sales', 61000, '2020-06-11', 'North'),
(7, 'Grace', 'IT', 75000, '2022-01-02', 'West'),
(8, 'Heidi', 'HR', 53000, '2020-04-10', 'East');

-- 1. Comparing Values Over Time
SELECT 
    employee_id,
    employee_name,
    department,
    salary,
    LAG(salary) OVER (PARTITION BY department ORDER BY joining_date) AS prev_salary,
    LEAD(salary) OVER (PARTITION BY department ORDER BY joining_date) AS next_salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY joining_date) AS row_num
FROM employees;

-- 2. Ranking Within a Category
SELECT 
    employee_id,
    employee_name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_dense_rank
FROM employees;

-- 3. Identifying the Best Records
-- Top 3 overall
SELECT * FROM (
    SELECT *, RANK() OVER (ORDER BY salary DESC) AS overall_rank
    FROM employees
) sub
WHERE overall_rank <= 3;

-- Top 3 per region
SELECT * FROM (
    SELECT *, RANK() OVER (PARTITION BY region ORDER BY salary DESC) AS region_rank
    FROM employees
) sub
WHERE region_rank <= 3;

-- 4. Finding the Earliest Records
SELECT * FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY joining_date) AS rn
    FROM employees
) sub
WHERE rn = 1;

-- 5. Aggregations with Window Functions
SELECT 
    employee_id,
    employee_name,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary,
    AVG(salary) OVER () AS overall_avg_salary
FROM employees;
