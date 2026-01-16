/*
LeetCode 610. Triangle Judgement

Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+

Each row contains three side lengths of a triangle.

Write a solution to report for every three line segments whether they can form a triangle.

Return the result table in any order.

The result format is in the following example.

Example:

Input:
Triangle table:
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+

Output:
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+
*/

/* Solution: CASE + Triangle Inequality */

SELECT
  x,
  y,
  z,
  CASE
    WHEN x + y > z
     AND x + z > y
     AND y + z > x
    THEN 'Yes'
    ELSE 'No'
  END AS triangle
FROM Triangle;
