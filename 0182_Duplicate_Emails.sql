/*
LeetCode 182. Duplicate Emails

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+

id is the primary key (column with unique values) for this table.
Each row of this table contains an email.
The email column is guaranteed to be NOT NULL.

Write a solution to find all duplicate emails.

Return the result table in any order.

The result format is in the following example.

Example:

Input:
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

Output:
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
*/

/* Solution: GROUP BY + HAVING */

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
