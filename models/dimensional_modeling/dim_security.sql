{{ config(
   materialized='view'
) }}

WITH security_cte AS (
    SELECT DISTINCT
        SECID AS security_id,
        CompID AS company_id,
        Symbol AS trading_symbol,
        CUSIP AS cusip_number,
        Issue AS security_name,
        SecType AS security_type,
        Class AS security_class,
        SecurityStatus AS security_status
    FROM `otc_market_data.otc_market_cleaning`
    WHERE SECID IS NOT NULL
),
company_info_cte AS (
    SELECT DISTINCT
        Symbol AS trading_symbol,
        Country AS country,
        State AS state,
        `Security Name` AS company_name
    FROM `otc_market_data.company_info_cleaning`
    WHERE Symbol IS NOT NULL
)

SELECT 
    sec.security_id,
    sec.company_id,
    sec.trading_symbol,
    sec.cusip_number,
    sec.security_name,
    sec.security_type,
    sec.security_class,
    sec.security_status,
    company.country,
    company.state,
    company.company_name,
    NULL AS finra_issuer_identifier, -- Add a placeholder column for missing data
    NULL AS security_description     -- Add a placeholder column for missing data
FROM security_cte AS sec
LEFT JOIN company_info_cte AS company
    ON sec.trading_symbol = company.trading_symbol
ORDER BY sec.security_id





























