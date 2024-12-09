{{ config(
   materialized='view'
) }}

WITH combined_dates AS (
    -- Extracting dates from `otc_market_cleaning`
    SELECT DISTINCT 
        `ClosingInsideBidPriceDate` AS raw_date
    FROM `otc_market_data.otc_market_cleaning`
    WHERE `ClosingInsideBidPriceDate` IS NOT NULL
    
    UNION ALL
    
    SELECT DISTINCT 
        `PreviousCloseDate` AS raw_date
    FROM `otc_market_data.otc_market_cleaning`
    WHERE `PreviousCloseDate` IS NOT NULL
),

dim_date_prepared AS (
    SELECT DISTINCT 
        raw_date,
        EXTRACT(YEAR FROM raw_date) AS year_number,
        EXTRACT(MONTH FROM raw_date) AS month_number,
        EXTRACT(QUARTER FROM raw_date) AS quarter_number,
        EXTRACT(DAY FROM raw_date) AS day_number,
        FORMAT_DATE('%A', raw_date) AS day_name,
        EXTRACT(WEEK FROM raw_date) AS week_of_year,
        FORMAT_DATE('%B', raw_date) AS month_name,
        CEIL(EXTRACT(DAY FROM raw_date) / 7) AS week_of_month
    FROM combined_dates
)

SELECT DISTINCT 
    raw_date AS date_id, -- Unique identifier
    year_number,
    month_number,
    quarter_number,
    day_number,
    day_name,
    week_of_year,
    month_name,
    week_of_month
FROM dim_date_prepared
ORDER BY date_id

