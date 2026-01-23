/*
LeetCode: 1211. Queries Quality and Percentage
Difficulty: Easy

------------------------------------------------------------
Table: Queries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+

- This table may contain duplicates.
- position is the position of the result in the search results list.
- rating is an integer from 1 to 5.
- Poor query is defined as rating < 3.
- Ignore rows where query_name IS NULL.

------------------------------------------------------------
Task:
For each query_name, calculate:
1) quality:
   average of (rating / position)

2) poor_query_percentage:
   percentage of queries with rating < 3

Round both values to 2 decimal places.

------------------------------------------------------------
Example:

Input (Queries table):
+------------+------------------+----------+--------+
| query_name | result           | position | rating |
+------------+------------------+----------+--------+
| Dog        | Golden Retriever | 1        | 5      |
| Dog        | German Shepherd  | 2        | 5      |
| Dog        | Mule             | 200      | 1      |
| Cat        | Shirazi          | 5        | 2      |
| Cat        | Siamese          | 3        | 3      |
| Cat        | Sphynx           | 7        | 4      |
+------------+------------------+----------+--------+

Output:
+------------+---------+----------------------+
| query_name | quality | poor_query_percentage|
+------------+---------+----------------------+
| Dog        | 2.50    | 33.33                |
| Cat        | 0.66    | 33.33                |
+------------+---------+----------------------+

Explanation:
Dog quality = avg(5/1, 5/2, 1/200) = 2.50
Dog poor %  = 1 poor row out of 3 total rows = 33.33%

Cat quality = avg(2/5, 3/3, 4/7) = 0.66
Cat poor %  = 1 poor row out of 3 total rows = 33.33%

------------------------------------------------------------
Approach:
- Group by query_name
- quality = AVG(rating / position)
- poor_query_percentage = AVG(rating < 3) * 100 using CASE
- Filter out NULL query_name

Time Complexity: O(n)
Space Complexity: O(1) extra (excluding output)
------------------------------------------------------------
*/

SELECT
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100, 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;
