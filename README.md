# NYC 311 Service Requests: Response Times, Complaint Patterns, and Borough-Level Performance

INFO 3401 Portfolio Project 2  
SQL analysis of NYC 311 service request data using Google BigQuery.

## Overview

This project analyzes 12 months of NYC 311 service request data, the city's non-emergency complaint system covering issues like noise, illegal parking, heat outages, street conditions, sanitation, and water/sewer complaints.

The analysis covers November 1, 2020 through October 31, 2021. The objective was to evaluate complaint volume, borough-level response times, agency workload distribution, and seasonal trends using SQL in BigQuery.

The dataset contains 2,718,173 complaints across 212 distinct complaint types, fielded by 16 city agencies.

## Dataset

Source: `bigquery-public-data.new_york_311.311_service_requests`

The dataset contains record-level 311 complaint data including timestamps, complaint type, descriptor, borough, responding agency, and resolution status. The public dataset stops updating in November 2021, so this project uses the most recent complete 12-month window available.

Date range analyzed: November 1, 2020 through October 31, 2021.

## Key Findings

### Complaint Volume

- NYC received 2,718,173 complaints over the 12-month analysis window.
- The dataset includes 212 distinct complaint types.
- 16 city agencies handled complaints during this period.
- This averages roughly 7,400 complaints per day.

### Top Complaint Types

- Noise - Residential was the largest complaint category with 372,598 complaints, accounting for 13.71% of total volume.
- Illegal Parking ranked second with 295,439 complaints, or 10.87%.
- HEAT/HOT WATER ranked fourth with 185,927 complaints, or 6.84%.
- When grouped together, noise-related complaints accounted for roughly 27% of total 311 volume.

### Borough Performance

- Brooklyn led in raw complaint volume with 780,587 complaints.
- The Bronx generated the most complaints per capita at roughly 409 complaints per 1,000 residents.
- Queens had the fastest average response time at 5.0 days.
- Staten Island had the slowest average response time at 7.3 days.
- Manhattan had a median response time of 1 hour but an average response time of 124 hours, showing how a small number of long-running cases can pull the mean upward.

### Agency Workload

- NYPD ranked as the top-volume agency in every borough.
- Much of NYPD's 311 volume came from quality-of-life issues such as noise complaints, illegal parking, and blocked driveways.
- HPD ranked second in the Bronx, Brooklyn, and Manhattan.
- DEP appeared in the top three only in Manhattan.
- Staten Island's top three agencies were NYPD, DOT, and DSNY.

### Seasonal Patterns

- Noise and Housing complaints followed inverse seasonal cycles.
- Housing complaints peaked in December at 53,337 and bottomed out in August at 11,408.
- Noise complaints climbed from 33,852 in February to 89,991 in June.
- This pattern suggests that NYPD demand scales up in summer, while HPD demand scales up in winter.

## SQL Techniques Used

- Aggregations with `COUNT`, `SUM`, and `AVG`
- `GROUP BY` with conditional filtering
- Common Table Expressions
- `TIMESTAMP_DIFF` for response-time calculations
- `APPROX_QUANTILES` to calculate medians
- `RANK()` window function with `PARTITION BY`
- `QUALIFY` to filter window-function output
- `CASE` statements for thematic categorization
- `FORMAT_DATE` for monthly aggregation

## SQL Files

1. [01_total_volume.sql](sql/01_total_volume.sql)  
   Establishes total complaint volume, unique complaint types, and responding agencies.

2. [02_top_complaints.sql](sql/02_top_complaints.sql)  
   Identifies the top 15 complaint types by volume.

3. [03_borough_volume.sql](sql/03_borough_volume.sql)  
   Breaks complaint volume down by borough.

4. [04_borough_response.sql](sql/04_borough_response.sql)  
   Calculates average and median response time by borough using a Common Table Expression.

5. [05_agency_ranking.sql](sql/05_agency_ranking.sql)  
   Uses a window function to rank the top agencies in each borough.

6. [06_monthly_trends.sql](sql/06_monthly_trends.sql)  
   Uses a CASE statement to group complaints into high-level categories and analyze monthly trends.

## Final Case Study

[View the final case study PDF](INFO3401Project2_CaseStudy.pdf)

## Reproduce the Analysis

1. Open Google BigQuery.
2. Use the public dataset: `bigquery-public-data.new_york_311.311_service_requests`.
3. Run the SQL files in order from the `sql/` folder.
4. Compare the query outputs to the findings summarized in the final case study PDF.

## Tools Used

- Google BigQuery
- SQL
- GitHub
- Google Docs

## Author

Nicolai Lazarev  
University of Colorado Boulder  
INFO 3401 Portfolio Project 2