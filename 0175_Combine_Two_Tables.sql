/*
LeetCode 175. Combine Two Tables

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+

personId is the primary key (column with unique values) for this table.
This table contains information about the ID of some persons and their
first and last names.


Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+

addressId is the primary key (column with unique values) for this table.
Each row of this table contains information about the city and state
of one person with ID = personId.


Problem:

Write a solution to report the first name, last name, city, and state
of each person in the Person table.

If the address of a personId is not present in the Address table,
report NULL instead.

Return the result table in any order.


Example:

Input:

Person table:

+----------+----------+-----------+
| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+

Address table:

+-----------+----------+---------------+------------+
| addressId | personId | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+

Output:

+-----------+----------+---------------+----------+
| firstName | lastName | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | NULL          | NULL     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+

Explanation:

There is no address in the Address table for personId = 1,
so NULL is returned for city and state.

addressId = 1 contains the address information for personId = 2.
*/


/*
Solution: LEFT JOIN

Approach:
- Start with the Person table because every person must appear.
- LEFT JOIN the Address table using personId.
- If a matching address exists, return the city and state.
- If no matching address exists, LEFT JOIN automatically returns
  NULL for city and state.
*/


-- Write your PostgreSQL query statement below

SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON a.personId = p.personId;