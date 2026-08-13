-- Problem: Signup Activation Rate / Second Day Confirmation
-- Platform: DataLemur (Easy)
-- Date: 2026-08-13

/*
Problem Summary:
This query identifies users who confirmed their accounts on the second day after signing up by comparing email and text action timestamps

Key Takeaways:
- I used timestamp casting (`::date`) to subtract the signup date from the action date and isolate users with a 1-day difference
- I joined the `emails` and `texts` tables on `email_id` and filtered for 'Confirmed' actions that happened exactly one day after account creation
- I was confused at first about the best way to handle date math, but realized subtracting casted dates worked well—though using `+ INTERVAL '1 day'` is a cleaner alternative I want to try next time
*/

SELECT e.user_id
FROM emails e
  JOIN texts t
    ON e.email_id = t.email_id
WHERE
  t.action_date::date - e.signup_date::date = 1 AND
  t.signup_action = 'Confirmed';
