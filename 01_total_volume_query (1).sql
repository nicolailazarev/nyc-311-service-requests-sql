-- Query 1: Total Complaint Volume
-- Purpose: Establish total complaint volume for the analysis period.
-- Date Range: November 1, 2020 – October 31, 2021

SELECT
  COUNT(*) AS total_complaints,
  COUNT(DISTINCT complaint_type) AS unique_complaint_types,
  COUNT(DISTINCT agency) AS responding_agencies
FROM
  `bigquery-public-data.new_york_311.311_service_requests`
WHERE
  created_date BETWEEN '2020-11-01' AND '2021-10-31';