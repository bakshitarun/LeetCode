/*

## Table: Logs

| Column Name | Type    |
|------------|---------|
| id         | int     |
| num        | varchar |

- `id` is the primary key (column with unique values).
- `id` is an autoincrement column starting from 1.
- Each row of this table contains a number logged in sequence.

---

## Problem Statement

Write a solution to **find all numbers that appear at least three times consecutively**.

- "Consecutively" means the numbers appear in **adjacent rows** ordered by `id`.
- Return the result table in **any order**.

---

## Example 1

### Input  
Logs table:

| id | num |
|----|-----|
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |

### Output

| ConsecutiveNums |
|-----------------|
| 1               |

### Explanation
- The number `1` appears **three times consecutively** at `id = 1, 2, 3`.
- No other number appears three times in a row.

---

## Solution (MySQL)

*/
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 
  ON l2.id = l1.id + 1 AND l2.num = l1.num
JOIN Logs l3 
  ON l3.id = l2.id + 1 AND l3.num = l2.num;