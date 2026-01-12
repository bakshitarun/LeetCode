/*
LeetCode 1789. Primary Department for Each Employee

Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| employee_id  | int     |
| department_id| int     |
| primary_flag | varchar |
+--------------+---------+

(employee_id, department_id) is the primary key for this table.
primary_flag is an ENUM of type ('Y', 'N').

- An employee can belong to multiple departments.
- If an employee belongs to multiple departments, exactly one row has primary_flag = 'Y'.
- If an employee belongs to only one department, the primary_flag may be 'N' (still that department is primary).

Write a solution to report the primary department for each employee.

Return the result table in any order.

Example:

Input:
Employee table:
+-------------+--------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+--------------+--------------+
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |
+-------------+--------------+--------------+

Output:
+-------------+--------------+
| employee_id | department_id|
+-------------+--------------+
| 1           | 1            |
| 2           | 1            |
| 3           | 3            |
| 4           | 3            |
+-------------+--------------+
*/

/*
Solution: UNION approach

Logic:
1) Select the department marked as primary ('Y').
2) For employees belonging to only one department, select that department.
UNION removes duplicates automatically.
*/

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1;
