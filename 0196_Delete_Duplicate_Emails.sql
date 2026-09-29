/*
--flag
LeetCode 196. Delete Duplicate Emails

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+

id is the primary key (column with unique values) for this table.
Each row of this table contains an email.
The emails will not contain uppercase letters.


Problem:

Delete all duplicate emails, keeping only one unique email
with the smallest id.

You must write a DELETE statement, not a SELECT statement.

After running the statement, the Person table should contain
only one row for each unique email.

The final order of the Person table does not matter.


Example:

Input:

Person table:

+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+

Output:

+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+

Explanation:

john@example.com appears twice.
The row with the smallest id (id = 1) is kept,
and the duplicate row with id = 3 is deleted.
*/


/*
Solution: DELETE with GROUP BY Subquery

Approach:
- GROUP BY email to identify each unique email.
- MIN(id) finds the smallest id for each email.
- These smallest IDs represent the rows we want to keep.
- Delete every row whose id is NOT in the list of minimum IDs.
*/


DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);


