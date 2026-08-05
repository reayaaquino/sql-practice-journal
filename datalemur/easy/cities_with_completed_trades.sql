-- Problem: Cities With Completed Trades
-- Platform: DataLemur (Easy)
-- Date: 2026-08-06

/*
Problem Summary:
Retrieve the top 3 cities with the highest number of completed orders in descending order.

Key Takeaways:
- Used table aliases (trades t, users u) to keep column prefixes clean and prevent ambiguous column reference errors
- GROUP BY u.city collapses the dataset down to 1 row per city, then COUNT(*) aggregates the total orders
- Must filter WHERE t.status = 'Completed' before grouping
*/

SELECT 
    u.city,
    COUNT(*) AS total_orders
FROM trades t
JOIN users u
    ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;
