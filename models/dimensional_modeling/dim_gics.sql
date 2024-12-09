{{ config(
   materialized='view'
) }}

WITH gics_cte AS (
    SELECT DISTINCT
        gics_code AS gics_id, -- Unique identifier for security
        sector_id AS sector_code, -- Map sector code
        sector AS sector_name, -- Map sector name
        industry_group_id AS industry_group_code, -- Map industry group code
        industry_group AS industry_group_name, -- Map industry group name
        industry_id AS industry_code, -- Map industry code
        industry AS industry_name, -- Map industry name
        sub_industry_id AS sub_industry_code, -- Map sub-industry code
        sub_industry AS sub_industry_name -- Map sub-industry name
    FROM `otc_market_data.otc_gics_cleaning`
    WHERE gics_code IS NOT NULL -- Ensure no null GICS codes
      AND sector_id IS NOT NULL -- Filter out rows without sector_id
      AND industry_group_id IS NOT NULL -- Filter out rows without industry_group_id
      AND industry_id IS NOT NULL -- Filter out rows without industry_id
      AND sub_industry_id IS NOT NULL -- Filter out rows without sub_industry_id
)

SELECT 
    gics_id,
    sector_code,
    sector_name,
    industry_group_code,
    industry_group_name,
    industry_code,
    industry_name,
    sub_industry_code,
    sub_industry_name
FROM gics_cte
