/*
LeetCode 586. Customer Placing the Largest Number of Orders

Table: Orders

+----------------+------+
| Column Name    | Type |
+----------------+------+
| order_number   | int  |
| customer_number| int  |
+----------------+------+

order_number is the primary key for this table.
This table contains information about the orders made by each customer.

Write a solution to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

Example:

Input:
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+

Output:
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
*/

/* Solution: GROUP BY + HAVING with MAX count (no LIMIT) */

SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(*) =
(
  SELECT MAX(cnt)
  FROM (
    SELECT COUNT(*) AS cnt
    FROM Orders
    GROUP BY customer_number
  ) t
);
