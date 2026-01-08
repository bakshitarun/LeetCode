/*
LeetCode 183. Customers Who Never Order

Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+

id is the primary key (column with unique values).
Each row of this table indicates the ID and name of a customer.

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+

Each row of this table indicates the ID of an order and the ID of the customer who placed it.

Write a solution to find all customers who never order anything.

Return the result table in any order.

The result format is in the following example.

Example:

Input:
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+

Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+

Output:
+----------+
| Customer |
+----------+
| Henry   |
| Max     |
+----------+
*/

/* Solution: LEFT JOIN + IS NULL (Preferred & Safe) */

SELECT c.name AS Customer
FROM Customers c
LEFT JOIN Orders o
  ON c.id = o.customerId
WHERE o.customerId IS NULL;
