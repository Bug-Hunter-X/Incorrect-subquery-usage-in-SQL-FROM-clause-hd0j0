The issue can be resolved using either a JOIN or by restructuring the subquery. Here are two corrected versions:

**Solution 1: Using JOIN**

```sql
SELECT 
    o.order_id, 
    SUM(oi.quantity * oi.price) as total_amount
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
GROUP BY 
    o.order_id;
```
This version uses a `JOIN` to combine the `orders` and `order_items` tables, allowing the direct calculation of `total_amount` using the `SUM` aggregate function and grouping by `o.order_id`.

**Solution 2: Correlated Subquery in SELECT clause**

```sql
SELECT 
    o.order_id, 
    (SELECT SUM(oi.quantity * oi.price) FROM order_items oi WHERE oi.order_id = o.order_id) as total_amount
FROM 
    orders o;
```
This version uses a correlated subquery in the SELECT clause which is typically acceptable because the subquery's scope now includes the `o.order_id` reference from the outer query. However, this method is often less efficient than a `JOIN` for larger datasets.