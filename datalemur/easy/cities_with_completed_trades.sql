-- Problem: Average Review Ratings
-- Platform: DataLemur (Easy)
-- Date: 2026-08-06

/*
Problem Summary:
Calculated the average star rating for each product by month and rounded the final result to 2 decimal places

Key Takeaways:
-Used EXTRACT(MONTH FROM submit_date) to pull the month out of the full timestamp so I could group the data
-Grouped by both the extracted month and product_id so each product gets its own separate monthly average rating
-I started with a CTE to extract the month first, but realized it added extra code for a simple query. I dropped it and repeated EXTRACT in the GROUP BY, then used the mth alias in ORDER BY since ORDER BY runs after SELECT creates the aliases
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
