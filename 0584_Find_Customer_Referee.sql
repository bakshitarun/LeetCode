/*
LeetCode 584. Find Customer Referee

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+

id is the primary key for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.

Write a solution to report the names of the customers that are not referred by the customer with id = 2.

Return the result table in any order.

Example:

Input:
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | NULL       |
| 2  | Jane | NULL       |
| 3  | Alex | 2          |
| 4  | Bill | NULL       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+

Output:
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
*/

/* Solution: Filter with NULL handling */

SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;