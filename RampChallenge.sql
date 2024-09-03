-- Ramp Coding Challenge Solution
-- This SQL script calculates the rolling 3-day average of the total transaction amount processed per day.
-- It specifically focuses on the date January 31.

WITH daily_totals AS (
  SELECT
    DATE(transaction_date) AS date,
    SUM(amount) AS total_amount
  FROM transactions
  GROUP BY DATE(transaction_date)
)

SELECT
  date,
  total_amount,
  AVG(total_amount) OVER (
    ORDER BY date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS rolling_3_day_avg
FROM daily_totals
WHERE date = '2021-01-31';  
