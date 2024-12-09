{{ config(
   materialized='view'
) }}

WITH source_data AS (
    SELECT DISTINCT 
        `BestBidSource` AS best_bid_source, -- For Best Bid Source
        `BestAskSource` AS best_ask_source -- For Best Ask Source
    FROM `otc_market_data.otc_market_cleaning`
    WHERE `BestBidSource` IS NOT NULL OR `BestAskSource` IS NOT NULL
)

SELECT 
    ROW_NUMBER() OVER () AS source_id, -- Generate unique source IDs
    best_bid_source,
    best_ask_source
FROM source_data
ORDER BY source_id
