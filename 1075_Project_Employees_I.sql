/*
1075. Project Employees I

Table: Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+

(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Each row indicates that an employee is working on a project.

Table: Employee

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+

employee_id is the primary key of this table.
experience_years is guaranteed to be NOT NULL.
Each row contains information about one employee.

Write an SQL query to report the average experience years of all employees
for each project, rounded to 2 digits.

Return the result table in any order.

Example 1:

Input:
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+

Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+

Output:
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+

Explanation:
The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00
and for the second project is (3 + 2) / 2 = 2.50.
*/

-- Write your PostgreSQL query statement below

SELECT
    project_id,
    ROUND(AVG(experience_years), 2) AS average_years
FROM project p
JOIN employee e
    ON p.employee_id = e.employee_id
GROUP BY project_id;