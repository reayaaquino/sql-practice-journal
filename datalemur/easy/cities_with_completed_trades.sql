-- Problem: Cities With Completed Trades
-- Platform: DataLemur (Easy)
-- Date: 2026-08-06

/*
Problem Summary:
Found the top 3 cities with the highest number of completed trade orders, sorted from highest to lowest.

Key Takeaways:
- Used an `INNER JOIN` with table aliases (`t` for trades and `u` for users) to bring city names into the trades table without cluttering column references
- Grouped the results by `u.city` so `COUNT(*)` could aggregate total trades for each city, then used `ORDER BY` and `LIMIT 3` to grab just the top results
- I made sure to place the `WHERE t.status = 'Completed'` filter before the `GROUP BY` clause so the query only counts finished orders instead of all activity
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
