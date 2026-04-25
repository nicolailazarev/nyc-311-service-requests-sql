-- Query 2: Top 15 Complaint Types
-- Purpose: Identify the most common 311 complaint categories.
-- Date Range: November 1, 2020 – October 31, 2021

SELECT
  complaint_type,
  COUNT(*) AS complaint_count,
  ROUND(COUNT(*) * 100.0 / 2718173, 2) AS percent_of_total
FROM
  `bigquery-public-data.new_york_311.311_service_requests`
WHERE
  created_date BETWEEN '2020-11-01' AND '2021-10-31'
GROUP BY
  complaint_type
ORDER BY
  complaint_count DESC
LIMIT 15;