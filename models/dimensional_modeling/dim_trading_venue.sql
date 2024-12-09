{{ config(
    materialized='view' 
) }}

WITH venue_cte AS (
    SELECT DISTINCT
        Venue AS trading_venue_name -- Extract unique trading venues
    FROM `otc_market_data.otc_market_cleaning`
    WHERE Venue IS NOT NULL
),
deduplicated_venue_cte AS (
    SELECT
        trading_venue_name
    FROM venue_cte
    GROUP BY trading_venue_name -- Ensure no duplicate venue names
),
row_numbered_venue_cte AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY trading_venue_name) AS trading_venue_id, -- Assign consistent IDs
        trading_venue_name
    FROM deduplicated_venue_cte
)

SELECT 
    trading_venue_id,
    trading_venue_name
FROM row_numbered_venue_cte



