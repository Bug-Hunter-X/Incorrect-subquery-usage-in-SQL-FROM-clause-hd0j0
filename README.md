# Incorrect Subquery Usage in SQL FROM Clause

This repository demonstrates a common error encountered when using subqueries within SQL queries.  The issue arises from attempting to access columns from the outer query within a subquery in the FROM clause, which is not supported by standard SQL and may produce syntax errors or incorrect results in certain database systems.

## Problem

The provided SQL query attempts to calculate the total amount for each order using a subquery. However, the subquery's reference to `o.order_id` from the outer `orders` table often results in a syntax error because the subquery's scope doesn't contain `o.order_id` before it is evaluated.

## Solution

The solution demonstrates the corrected approach using either a JOIN operation or a correlated subquery in the SELECT clause. The `JOIN` operation is generally more efficient. 