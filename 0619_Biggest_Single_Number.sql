/*
LeetCode: 619. Biggest Single Number
Difficulty: Easy

------------------------------------------------------------
Table: MyNumbers

+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+

- This table may contain duplicates.
- A single number is a number that appears exactly once.

------------------------------------------------------------
Task:
Find the largest single number.
If there is no single number, return NULL.

------------------------------------------------------------
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
Single numbers are 1, 4, 5, and 6.
The largest single number is 6.

------------------------------------------------------------
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
+-----+

Output:
+------+
| num  |
+------+
| NULL |
+------+

Explanation:
There are no numbers that appear exactly once.

------------------------------------------------------------
Approach:
- Group by num and keep only numbers that appear once
- Use MAX() to return the largest such number
- MAX() naturally returns NULL if no rows exist

Time Complexity: O(n)
Space Complexity: O(n) for grouping
------------------------------------------------------------
*/

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) a;
