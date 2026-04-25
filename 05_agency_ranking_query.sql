-- Query 5: Agency Performance with Borough-Level Ranking
-- Purpose: Rank each agency's complaint volume within each borough using a
--          window function. Reveals which agencies dominate in different
--          parts of the city.
-- Date Range: November 1, 2020 – October 31, 2021

WITH agency_borough_volume AS (
  SELECT
    borough,
    agency,
    agency_name,
    COUNT(*) AS complaint_count
  FROM
    `bigquery-public-data.new_york_311.311_service_requests`
  WHERE
    created_date BETWEEN '2020-11-01' AND '2021-10-31'
    AND borough IS NOT NULL
    AND borough != ''
    AND borough != 'Unspecified'
  GROUP BY
    borough, agency, agency_name
)

SELECT
  borough,
  agency,
  agency_name,
  complaint_count,
  RANK() OVER (PARTITION BY borough ORDER BY complaint_count DESC) AS rank_in_borough
FROM
  agency_borough_volume
QUALIFY
  rank_in_borough <= 3
ORDER BY
  borough, rank_in_borough;