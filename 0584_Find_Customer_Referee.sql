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

id is the primary key column for this table.

Each row indicates the ID of a customer, their name,
and the ID of the customer who referred them.


Problem:

Find the names of customers who are either:

1. Referred by any customer with id != 2.
2. Not referred by any customer.

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


/*
Solution: NULL Check with Inequality Filter

Approach:
- referee_id != 2 returns customers who were referred by
  someone other than customer 2.
- referee_id IS NULL returns customers who were not referred
  by anyone.
- Use OR to include customers satisfying either condition.
- The explicit NULL check is necessary because comparisons
  such as NULL != 2 evaluate to UNKNOWN in SQL.
*/


-- Write your PostgreSQL query statement below

SELECT
    name
FROM Customer
WHERE referee_id IS NULL
   OR referee_id != 2;