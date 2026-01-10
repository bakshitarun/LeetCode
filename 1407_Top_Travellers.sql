/*
LeetCode 1407. Top Travellers

Table: Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+

id is the primary key for this table.
name is the name of the user.

Table: Rides

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| user_id     | int  |
| distance    | int  |
+-------------+------+

id is the primary key for this table.
user_id is the id of the user who traveled the ride.
distance is the distance traveled.

Write a solution to report the distance traveled by each user.
If a user has not traveled any distance, report 0.

Return the result table ordered by travelled_distance in descending order,
and by name in ascending order.

Example:

Input:
Users table:
+------+-----------+
| id   | name      |
+------+-----------+
| 1    | Alice     |
| 2    | Bob       |
| 3    | Alex      |
| 4    | Donald    |
| 7    | Lee       |
| 13   | Jonathan  |
| 19   | Elvis     |
+------+-----------+

Rides table:
+------+---------+----------+
| id   | user_id | distance |
+------+---------+----------+
| 1    | 1       | 120      |
| 2    | 2       | 317      |
| 3    | 3       | 222      |
| 4    | 7       | 100      |
| 5    | 13      | 312      |
| 6    | 19      | 50       |
| 7    | 7       | 120      |
| 8    | 19      | 400      |
| 9    | 7       | 230      |
+------+---------+----------+

Output:
+----------+--------------------+
| name     | travelled_distance |
+----------+--------------------+
| Elvis    | 450                |
| Lee      | 450                |
| Bob      | 317                |
| Jonathan | 312                |
| Alex     | 222                |
| Alice    | 120                |
| Donald   | 0                  |
+----------+--------------------+
*/

/* Solution: CTE + LEFT JOIN + IFNULL */

WITH td AS (
  SELECT user_id, SUM(distance) AS travelled_distance
  FROM Rides
  GROUP BY user_id
)
SELECT
  name,
  IFNULL(travelled_distance, 0) AS travelled_distance
FROM Users
LEFT JOIN td
  ON td.user_id = Users.id
ORDER BY travelled_distance DESC, name ASC;
