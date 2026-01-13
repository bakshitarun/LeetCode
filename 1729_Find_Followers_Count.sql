/*
LeetCode 1729. Find Followers Count

Table: Followers

+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+

(user_id, follower_id) is the primary key of this table.
Each row indicates that follower_id follows user_id.

Write a solution to report the number of followers for each user.

Return the result table ordered by user_id in ascending order.

Example:

Input:
Followers table:
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |
+---------+-------------+

Output:
+---------+-----------------+
| user_id | followers_count |
+---------+-----------------+
| 0       | 1               |
| 1       | 1               |
| 2       | 2               |
+---------+-----------------+
*/

/* Solution: GROUP BY + COUNT */

SELECT
  user_id,
  COUNT(*) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
