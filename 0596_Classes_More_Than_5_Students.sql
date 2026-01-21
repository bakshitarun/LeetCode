/*
LeetCode 596. Classes More Than 5 Students

Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+

(student, class) is the primary key for this table.
Each row indicates the name of a student and the class they are enrolled in.

Write a solution to find all classes that have at least 5 students.

Return the result table in any order.

Example:

Input:
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+

Output:
+-------+
| class |
+-------+
| Math  |
+-------+
*/

/* Solution: GROUP BY + HAVING */

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;
