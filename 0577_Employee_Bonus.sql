/*
LeetCode 577. Employee Bonus

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+

empId is the column with unique values for this table.

Each row indicates the name and ID of an employee,
their salary, and the ID of their manager.


Table: Bonus

+-------------+------+
| Column Name | Type |
+-------------+------+
| empId       | int  |
| bonus       | int  |
+-------------+------+

empId is the column with unique values for this table.
empId is a foreign key referencing empId from the Employee table.

Each row contains the ID of an employee and their respective bonus.


Problem:

Report the name and bonus amount of each employee who satisfies
either of the following conditions:

- The employee has a bonus less than 1000.
- The employee did not receive any bonus.

Return the result table in any order.


Example:

Input:

Employee table:

+-------+--------+------------+--------+
| empId | name   | supervisor | salary |
+-------+--------+------------+--------+
| 3     | Brad   | NULL       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |
+-------+--------+------------+--------+

Bonus table:

+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+

Output:

+------+-------+
| name | bonus |
+------+-------+
| Brad | NULL  |
| John | NULL  |
| Dan  | 500   |
+------+-------+
*/


/*
Solution: LEFT JOIN with Bonus Filter

Approach:
- Start with the Employee table because employees without a bonus
  must also be included.
- LEFT JOIN Bonus using empId.
- If an employee has no matching Bonus row, b.bonus will be NULL.
- Keep employees whose bonus is less than 1000.
- Also keep employees whose bonus is NULL.
*/


-- Write your PostgreSQL query statement below

SELECT
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;