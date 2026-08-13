-- Problem: Average Review Ratings
-- Platform: DataLemur (Easy)
-- Date: 2026-08-06

/*
Problem Summary:
Calculate the average star rating for each product per month, rounded to 2 decimal places

Key Takeaways:
- Used EXTRACT(MONTH FROM submit_date) to pull the month number from the timestamp
- Grouped by both month and product_id so each product gets its own monthly average
- Wrapped AVG() inside ROUND(..., 2) to cap results at 2 decimal places
- Initially used a CTE to make the month column, but dropped it since it adds unnecessary overhead for a basic query.
  Switched to repeating EXTRACT in GROUP BY, and used the mth alias in ORDER BY since SELECT builds the final table (and creates the aliases) before ORDER BY runs
*/

SELECT 
    EXTRACT(MONTH FROM submit_date) AS mth,
    product_id,
    ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY 
    EXTRACT(MONTH FROM submit_date),
    product_id
ORDER BY 
    mth ASC,
    product_id ASC;
