-- Problem: App Click-Through Rate (CTR)
-- Platform: DataLemur (Easy)
-- Date: 2026-08-13

/*
Problem Summary:
Calculated the Click-Through Rate (CTR) for each app in 2022 and rounded the final percentage to two decimal places.

Key Takeaways:
-Used CASE WHEN statements inside COUNT() to filter and tally impressions and clicks in the same step.
-Multiplied by 100.0 instead of 100 so SQL calculates the result as a decimal rather than rounding down to a whole integer.
-I originally filtered dates with EXTRACT(), but realized using standard < and >= comparison operators is better for performance because it lets SQL use indexes.
-I also realized I didn't strictly need a CTE here—I could have done this in a single SELECT statement using SUM(CASE WHEN ...)—but the CTE kept my logic readable.
*/

WITH event_cte AS (
  SELECT
    app_id,
    COUNT(CASE WHEN event_type = 'impression' THEN 1 END) AS impression_count,
    COUNT(CASE WHEN event_type = 'click' THEN 1 END) AS click_count
  FROM events
WHERE
  timestamp >= '2022-01-01' AND
  timestamp < '2023-01-01'
GROUP BY app_id
)
SELECT
  app_id,
  ROUND(100.0 * click_count/impression_count,2) AS ctr
FROM event_cte
