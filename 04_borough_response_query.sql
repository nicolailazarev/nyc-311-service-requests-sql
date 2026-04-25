-- Query 4: Average Response Time by Borough
-- Purpose: Calculate how long it takes the city to resolve 311 complaints,
--          broken down by borough. Uses a CTE to filter to closed complaints
--          and compute response time in hours before aggregating.
-- Date Range: November 1, 2020 – October 31, 2021

WITH closed_complaints AS (
  SELECT
    borough,
    TIMESTAMP_DIFF(closed_date, created_date, HOUR) AS response_hours
  FROM
    `bigquery-public-data.new_york_311.311_service_requests`
  WHERE
    created_date BETWEEN '2020-11-01' AND '2021-10-31'
    AND closed_date IS NOT NULL
    AND closed_date > created_date
    AND borough IS NOT NULL
    AND borough != ''
    AND borough != 'Unspecified'
)

SELECT
  borough,
  COUNT(*) AS resolved_complaints,
  ROUND(AVG(response_hours), 1) AS avg_response_hours,
  ROUND(AVG(response_hours) / 24, 1) AS avg_response_days,
  APPROX_QUANTILES(response_hours, 2)[OFFSET(1)] AS median_response_hours
FROM
  closed_complaints
GROUP BY
  borough
ORDER BY
  avg_response_hours ASC;