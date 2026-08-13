-- Problem: Well Paid Employees
-- Platform: DataLemur (Easy)
-- Date: 2026-08-13

/*
Problem Summary:
Finds employees who earn a higher salary than their direct managers.

Key Takeaways:
-Used a self-join to connect the employee table to itself for the first time
-By joining the table on the manager ID, I lined up the employee and manager salaries side by side so I could use a simple greater-than comparison
-I was confused at first because I didn't know you could reuse the same table in a query. I realized I could just use short table aliases (e and m) without typing AS to treat it like two separate tables and keep the code easy to read
*/

SELECT
  e.employee_id,
  e.name
FROM employee e
JOIN employee m
  ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
