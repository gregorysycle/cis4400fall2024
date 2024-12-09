
SELECT Symbol, COUNT(*) AS Count
FROM `mystic-planet-442018-a4.otc_market_data.company_info_cleaning`
GROUP BY Symbol
HAVING COUNT(*) > 1;


CREATE OR REPLACE TABLE `mystic-planet-442018-a4.otc_market_data.company_info_cleaning` AS
SELECT *
FROM (
 SELECT *, ROW_NUMBER() OVER (PARTITION BY Symbol) AS row_num
 FROM `mystic-planet-442018-a4.otc_market_data.company_info_cleaning`
)
WHERE row_num = 1;


UPDATE `mystic-planet-442018-a4.otc_market_data.company_info_cleaning`
SET `Change %` = 0.00
WHERE `Change %` IS NULL 

UPDATE `mystic-planet-442018-a4.otc_market_data.company_info_cleaning`
SET state = 'Unknown'
WHERE state IS NULL AND country = 'USA';


UPDATE `mystic-planet-442018-a4.otc_market_data.company_info_cleaning`
SET country = 'Unknown'
WHERE country IS NULL 

UPDATE `mystic-planet-442018-a4.otc_market_data.otc_gics_cleaning`
SET sector = 'Unknown', sector_id = 0
WHERE sector_id IS NULL OR TRIM(sector) IS NULL;

UPDATE `mystic-planet-442018-a4.otc_market_data.otc_gics_cleaning`
SET 
  industry_group_id = 0,
  industry_group = 'Unknown',
  industry_id = 0,
  industry = 'Unknown',
  sub_industry_id = 0,
  sub_industry = 'Unknown'
WHERE 
  industry_group_id IS NULL 
  OR TRIM(industry_group) IS NULL
  OR industry_id IS NULL 
  OR TRIM(industry) IS NULL
  OR sub_industry_id IS NULL 
  OR TRIM(sub_industry) IS NULL;



UPDATE `mystic-planet-442018-a4.otc_market_data.otc_securities_cleaning`
SET country = 'Unknown'
WHERE country IS NULL;


UPDATE `mystic-planet-442018-a4.otc_market_data.otc_securities_cleaning`
SET issuerName= 'Unknown'
WHERE issuerName IS NULL;

DELETE FROM `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
WHERE SecType IS NULL;


UPDATE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
SET Class = 'UNKNOWN'
WHERE Class IS NULL;


UPDATE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
SET Class = UPPER(Class)
WHERE Class != UPPER(Class);

update `otc_market_data.otc_market_cleaning`
set BestBidSource = 'Unknown'
where BestBidSource is null



UPDATE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
SET BestAskSource = 'Unknown'
WHERE BestAskSource IS NULL


ALTER TABLE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
ADD COLUMN PivotPoint FLOAT64;

UPDATE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
SET PivotPoint = CAST(
    FORMAT(
      '%.10f',
      (HighPrice + LowPrice + PreviousClosePrice) / 3
    ) AS FLOAT64
  )
WHERE HighPrice IS NOT NULL 
  AND LowPrice IS NOT NULL 
  AND PreviousClosePrice IS NOT NULL;

ALTER TABLE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
ADD COLUMN ClosingSpreadInside FLOAT64;

ALTER TABLE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
ADD COLUMN ClosingSpreadBest FLOAT64;

UPDATE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
SET ClosingSpreadInside = CAST(
    FORMAT(
      '%.10f',
      (ClosingInsideAskPrice - ClosingInsideBidPrice) / ClosingInsideAskPrice
    ) AS FLOAT64
  )
WHERE ClosingInsideAskPrice IS NOT NULL 
  AND ClosingInsideBidPrice IS NOT NULL
  AND ClosingInsideAskPrice > 0;

UPDATE `mystic-planet-442018-a4.otc_market_data.otc_market_cleaning`
SET ClosingSpreadBest = CAST(
    FORMAT(
      '%.10f',
      (ClosingBestAsk - ClosingBestBid) / ClosingBestAsk
    ) AS FLOAT64
  )
WHERE ClosingBestAsk IS NOT NULL
  AND ClosingBestBid IS NOT NULL
  AND ClosingBestAsk > 0;


