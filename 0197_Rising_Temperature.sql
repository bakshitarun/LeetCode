/*
LeetCode 197. Rising Temperature

Table: Weather

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| recordDate  | date |
| temperature | int  |
+-------------+------+

id is the primary key for this table.
This table contains information about the temperature on a certain day.

Write a solution to find all dates' id with higher temperatures compared to the previous day (yesterday).

Return the result table in any order.

The result format is in the following example.

Example:

Input:
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+

Output:
+----+
| id |
+----+
| 2  |
| 4  |
+----+
*/

/* Solution: Self-Join on Consecutive Dates */

SELECT w2.id
FROM Weather w1
JOIN Weather w2
  ON DATE_ADD(w1.recordDate, INTERVAL 1 DAY) = w2.recordDate
WHERE w1.temperature < w2.temperature;
