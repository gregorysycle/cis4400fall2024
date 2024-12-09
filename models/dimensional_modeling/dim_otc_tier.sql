{{ config(
    materialized='view'  
) }}

WITH tier_cte AS (
    SELECT DISTINCT
        TierID,              
        TierName AS otc_tier_name,         
        DAD_PAL AS dad_pal_sponsor 
    FROM `otc_market_data.otc_market_cleaning`
    WHERE TierID IS NOT NULL AND TierName IS NOT NULL 
)

SELECT 
    TierID AS otc_tier_id,       
    otc_tier_name,
    dad_pal_sponsor
FROM tier_cte
ORDER BY otc_tier_name
 