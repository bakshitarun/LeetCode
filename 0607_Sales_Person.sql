/*
LeetCode 607. Sales Person

Table: SalesPerson

+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |
+-----------------+---------+

sales_id is the primary key for this table.
Each row contains information about a sales person.

Table: Company

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| com_id      | int     |
| name        | varchar |
| city        | varchar |
+-------------+---------+

com_id is the primary key for this table.
Each row contains information about a company.

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |
+-------------+------+

order_id is the primary key for this table.
com_id is a foreign key to Company.com_id.
sales_id is a foreign key to SalesPerson.sales_id.

Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

Return the result table in any order.

Example:

Input:
SalesPerson table:
+----------+------+--------+-----------------+------------+
| sales_id | name | salary | commission_rate | hire_date  |
+----------+------+--------+-----------------+------------+
| 1        | John | 100000 | 6               | 2006-04-01 |
| 2        | Amy  | 12000  | 5               | 2010-05-01 |
| 3        | Mark | 65000  | 12              | 2008-12-25 |
| 4        | Pam  | 25000  | 25              | 2005-01-01 |
| 5        | Alex | 50000  | 10              | 2007-02-03 |
+----------+------+--------+-----------------+------------+

Company table:
+--------+-------+----------+
| com_id | name  | city     |
+--------+-------+----------+
| 1      | RED   | Boston   |
| 2      | ORANGE| New York |
| 3      | YELLOW| Boston   |
| 4      | GREEN | Austin   |
+--------+-------+----------+

Orders table:
+----------+------------+--------+----------+--------+
| order_id | order_date | com_id | sales_id | amount |
+----------+------------+--------+----------+--------+
| 1        | 2014-01-01 | 3      | 4        | 100000 |
| 2        | 2014-02-01 | 4      | 5        | 5000   |
| 3        | 2014-03-01 | 1      | 1        | 50000  |
| 4        | 2014-04-01 | 1      | 4        | 25000  |
+----------+------------+--------+----------+--------+

Output:
+------+
| name |
+------+
| Amy  |
| Mark |
| Alex |
+------+
*/

/* Solution: NOT IN + JOIN (anti-join) */

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
  SELECT o.sales_id
  FROM Orders o
  JOIN Company c
    ON c.com_id = o.com_id
  WHERE c.name = 'RED'
);
