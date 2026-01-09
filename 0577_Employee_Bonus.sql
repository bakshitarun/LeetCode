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

empId is the primary key for this table.
Each row contains information about an employee.

Table: Bonus

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| bonus       | int     |
+-------------+---------+

empId is the primary key for this table.
Each row contains the bonus information for an employee.

Write a solution to report the name and bonus of each employee 
whose bonus is less than 1000.

Employees who do not have a bonus record should also be included.

Return the result table in any order.

Example:

Input:
Employee table:
+-------+------+------------+--------+
| empId | name | supervisor | salary |
+-------+------+------------+--------+
| 3     | Brad | NULL       | 4000   |
| 1     | John | 3          | 1000   |
| 2     | Dan  | 3          | 2000   |
| 4     | Tom  | 1          | 2000   |
+-------+------+------------+--------+

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

/* Solution: LEFT JOIN + NULL handling */

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
  ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;
