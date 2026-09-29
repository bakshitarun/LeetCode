/*
LeetCode 181. Employees Earning More Than Their Managers

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+

id is the primary key (column with unique values) for this table.

Each row of this table indicates the ID of an employee, their name,
salary, and the ID of their manager.


Problem:

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.


Example:

Input:

Employee table:

+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+

Output:

+----------+
| Employee |
+----------+
| Joe      |
+----------+

Explanation:

Joe earns $70,000 while his manager Sam earns $60,000.
Therefore, Joe is the only employee who earns more than his manager.
*/


/*
Solution: Self-Join

Approach:
- Join the Employee table with itself.
- e1 represents the employee.
- e2 represents the employee's manager.
- Match e1.managerId with e2.id.
- Compare the employee's salary with the manager's salary.
- Return employees whose salary is greater than their manager's salary.
*/


-- Write your PostgreSQL query statement below

SELECT
    e1.name AS Employee
FROM Employee e1
LEFT JOIN Employee e2
    ON e1.managerId = e2.id
WHERE e1.salary > e2.salary
  AND e1.managerId IS NOT NULL;