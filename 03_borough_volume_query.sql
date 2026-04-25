-- Query 3: Complaints by Borough
-- Purpose: Identify which NYC boroughs generate the most 311 complaint volume.
-- Date Range: November 1, 2020 – October 31, 2021

SELECT
  borough,
  COUNT(*) AS complaint_count,
  ROUND(COUNT(*) * 100.0 / 2718173, 2) AS percent_of_total,
  COUNT(DISTINCT complaint_type) AS unique_complaint_types
FROM
  `bigquery-public-data.new_york_311.311_service_requests`
WHERE
  created_date BETWEEN '2020-11-01' AND '2021-10-31'
GROUP BY
  borough
ORDER BY
  complaint_count DESC;