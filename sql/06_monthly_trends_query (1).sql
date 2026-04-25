-- Query 6: Monthly Complaint Trends with Category Bucketing
-- Purpose: Track how complaint volume changed month-over-month, broken into
--          high-level thematic categories (Noise, Housing, Sanitation, etc.)
--          using a CASE statement.
-- Date Range: November 1, 2020 – October 31, 2021

SELECT
  FORMAT_DATE('%Y-%m', DATE(created_date)) AS year_month,
  CASE
    WHEN complaint_type LIKE 'Noise%' THEN 'Noise'
    WHEN complaint_type IN ('HEAT/HOT WATER', 'UNSANITARY CONDITION', 'PLUMBING', 'PAINT/PLASTER', 'GENERAL CONSTRUCTION', 'ELECTRIC') THEN 'Housing'
    WHEN complaint_type IN ('Illegal Parking', 'Blocked Driveway', 'Abandoned Vehicle', 'Derelict Vehicles', 'Street Condition', 'Street Light Condition') THEN 'Streets & Vehicles'
    WHEN complaint_type IN ('Missed Collection (All Materials)', 'Dirty Conditions', 'Sanitation Condition', 'Overflowing Litter Baskets') THEN 'Sanitation'
    WHEN complaint_type IN ('Water System', 'Sewer') THEN 'Water/Sewer'
    ELSE 'Other'
  END AS complaint_category,
  COUNT(*) AS complaint_count
FROM
  `bigquery-public-data.new_york_311.311_service_requests`
WHERE
  created_date BETWEEN '2020-11-01' AND '2021-10-31'
GROUP BY
  year_month, complaint_category
ORDER BY
  year_month, complaint_count DESC;