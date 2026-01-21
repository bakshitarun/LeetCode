/*
LeetCode 3497. Analyze Subscription Conversion

Table: UserActivity

+-------------------+---------+
| Column Name       | Type    |
+-------------------+---------+
| user_id           | int     |
| activity_date     | date    |
| activity_type     | varchar |
| activity_duration | int     |
+-------------------+---------+

This table records user activities in a subscription system.
activity_type can be: 'free_trial', 'paid', 'cancelled'.

A user is considered converted if they have activity in both:
- 'free_trial'
- 'paid'

Write a solution to analyze subscription conversion by reporting:
- user_id
- average activity duration during free trial (trial_avg_duration)
- average activity duration during paid subscription (paid_avg_duration)

Round both averages to 2 decimal places.
Return the result table ordered by user_id in ascending order.
*/

/* Solution: Two CTEs (trial + paid) and INNER JOIN */

WITH free AS (
  SELECT
    user_id,
    ROUND(AVG(activity_duration), 2) AS trial_avg_duration
  FROM UserActivity
  WHERE activity_type = 'free_trial'
  GROUP BY user_id
),
paid AS (
  SELECT
    user_id,
    ROUND(AVG(activity_duration), 2) AS paid_avg_duration
  FROM UserActivity
  WHERE activity_type = 'paid'
  GROUP BY user_id
)
SELECT
  f.user_id,
  f.trial_avg_duration,
  p.paid_avg_duration
FROM free f
JOIN paid p
  ON f.user_id = p.user_id
ORDER BY f.user_id;
