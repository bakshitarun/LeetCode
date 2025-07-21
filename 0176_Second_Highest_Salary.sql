/*
LeetCode 176: Second Highest Salary

176. Second Highest Salary

Table: Employee
+-------------+------+ 
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.

Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, the result should be null.
Return the result table as shown in the example below.

Example 1:
Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Example 2:
Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
*/

-- Dummy Data for Employee table
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);

-- Insert dummy data for testing
INSERT INTO Employee (id, salary) VALUES
    (1, 100),
    (2, 200),
    (3, 300);


-- Solution for the main problem
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;


-- Clean up Employee table before inserting new data
delete from Employee;
-- Dummy Data for Employee table
INSERT INTO Employee_Test2 (id, salary) VALUES
    (1, 100);

-- Solution for Test Case 2
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary_Test2;
