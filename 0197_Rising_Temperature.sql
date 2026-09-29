/*
LeetCode 197. Rising Temperature

Table: Weather

+---------------+------+
| Column Name   | Type |
+---------------+------+
| id            | int  |
| recordDate    | date |
| temperature   | int  |
+---------------+------+

id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.


Problem:

Find all dates' id with higher temperatures compared to the
previous day (yesterday).

Return the result table in any order.


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

Explanation:

On 2015-01-02, the temperature increased from 10 to 25.
On 2015-01-04, the temperature increased from 20 to 30.
*/


/*
Solution: Correlated EXISTS Subquery

Approach:
- w1 represents the current day's weather.
- w2 represents a potential previous day's weather.
- Check that w2.recordDate is exactly one day before w1.recordDate.
- Compare the temperatures of the two days.
- EXISTS returns the current day's id when yesterday exists
  and the current temperature is higher.
*/


-- Write your PostgreSQL query statement below

SELECT
    w1.id
FROM Weather w1
WHERE EXISTS (
    SELECT 1
    FROM Weather w2
    WHERE w1.temperature > w2.temperature
      AND w1.recordDate = w2.recordDate + 1
);