/*
LeetCode 196. Delete Duplicate Emails

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+

id is the primary key (column with unique values).
Each row of this table contains an email.
The email column is guaranteed to be NOT NULL.

Write a solution to delete all duplicate emails, 
keeping only one unique email with the smallest id.

After running your SQL statement, the Person table should contain 
only unique email entries.

The result format is not returned, as this is a DELETE operation.

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
Person table after delete:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
+----+---------+
*/

/* Solution: Self-Join DELETE (MySQL-safe and optimal) */

DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
 AND p1.id > p2.id;
