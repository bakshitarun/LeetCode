/*
LeetCode 619. Biggest Single Number

Table: MyNumbers

+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+

This table may contain duplicates.
There is no primary key for this table in SQL.
Each row of this table contains an integer.


Problem:

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number.
If there is no single number, report NULL.


Example 1:

Input:

MyNumbers table:

+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+

Output:

+-----+
| num |
+-----+
| 6   |
+-----+

Explanation:

The single numbers are 1, 4, 5, and 6.
Since 6 is the largest single number, we return it.


Example 2:

Input:

MyNumbers table:

+-----+
| num |
+-----+
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |
+-----+

Output:

+------+
| num  |
+------+
| NULL |
+------+

Explanation:

There are no single numbers in the input table, so we return NULL.
*/


-- Write your PostgreSQL query statement below

SELECT
    MAX(num) AS num
FROM (
    SELECT
        num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) n;