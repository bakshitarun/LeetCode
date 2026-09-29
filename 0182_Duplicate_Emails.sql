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
The emails will not contain uppercase letters.
The email field is guaranteed to be NOT NULL.


Problem:

Write a solution to report all duplicate emails.

Return the result table in any order.


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

Explanation:

a@b.com appears two times, so it is a duplicate email.
*/


/*
Solution: GROUP BY with HAVING

Approach:
- GROUP BY email to combine rows with the same email address.
- COUNT(*) calculates how many times each email appears.
- HAVING filters the grouped results.
- Keep only emails that appear more than once.
*/


-- Write your PostgreSQL query statement below

SELECT
    email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;