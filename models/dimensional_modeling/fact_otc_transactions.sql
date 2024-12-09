{{
   config(
       materialized='view'
   )
}}


WITH raw_fact_cte AS (
    SELECT 
        *,
        CAST(FORMAT_TIMESTAMP('%Y%m%d%H', TIMESTAMP(ClosingInsideBidPriceDate)) AS INT64) AS ClosingInsideBidPriceDateID,
        CAST(FORMAT_TIMESTAMP('%Y%m%d%H', TIMESTAMP(ClosingInsideAskPriceDate)) AS INT64) AS ClosingInsideAskPriceDateID,
        CAST(FORMAT_TIMESTAMP('%Y%m%d%H', TIMESTAMP(PreviousCloseDate)) AS INT64) AS PreviousCloseDateID,
        CAST(FORMAT_TIMESTAMP('%Y%m%d%H', TIMESTAMP(ClosingBestBidDate)) AS INT64) AS ClosingBestBidDateID,
        CAST(FORMAT_TIMESTAMP('%Y%m%d%H', TIMESTAMP(ClosingBestAskDate)) AS INT64) AS ClosingBestAskDateID,
        SharesOutstandingAsOfDate AS TotalSharesOutstandingDate
    FROM `otc_market_data.otc_market_cleaning`
), 
joined_fact_cte AS (
   SELECT
       rf.*,
       ds.source_id AS SourceID,
       gics.gics_id AS GICSID,
       tv.trading_venue_id AS TradingVenueID
   FROM raw_fact_cte rf
   LEFT JOIN `dbt_dkhotunitskaya.dim_source` ds
       ON rf.BestBidSource = ds.best_bid_source
   LEFT JOIN `dbt_dkhotunitskaya.dim_gics` gics
       ON rf.SECID = gics.sector_code
   LEFT JOIN `dbt_dkhotunitskaya.dim_trading_venue` tv
       ON rf.Venue = tv.trading_venue_name
),
fact_cte AS (
   SELECT
       GENERATE_UUID() AS FactsID,
       ClosingInsideBidPrice AS Closing_Inside_Bid,
       ClosingInsideAskPrice AS Closing_Inside_Ask,
       InsideBid_AskMidPrice AS Closing_Mid_Price,
       OpenPrice AS Price_Open,
       HighPrice AS Price_High,
       LowPrice AS Price_Low,
       LastPrice AS Price_Last,
       PreviousClosePrice AS Previous_Close_Price,
       ShareVolume AS Share_Volume,
       DollarVol AS Dollar_Volume,
       TradeCount AS TradeCount,
       OTCLinkShareVol AS OTC_Link_Share_Volume,
       OTCLinkDolVol AS OTC_Link_Dol_Volume,
       OTCLinkExecCount AS OTC_Link_Trade_Count,
       SHOFlag AS Reg_SHO_Status_Flag,
       Rule3210Flag AS Rule_3210_Status_Flag,
       ShortIntVol AS Short_Interest_Shares,
       ShortInterestDate AS Short_Interest_Date,
       MMIDCount AS Number_Of_Market_Makers,
       BFCMmid AS Bona_Fide_Continuous,
       ClosingBestBid AS Closing_Best_Bid,
       ClosingBestAsk AS Closing_Best_Ask,
       SharesOutstanding AS Total_Shares_Outstanding,
       ClosingSpreadInside AS Closing_Spread_Inside,
       ClosingSpreadBest AS Closing_Spread_Best,
       PivotPoint AS Pivot_Point,
       CaveatEmptor AS Caveat_Emptor_Flag,
       ClosingInsideBidPriceDateID AS Closing_Inside_Bid_Price_Date_ID,
       ClosingInsideAskPriceDateID AS Closing_Inside_Ask_Price_Date_ID,
       PreviousCloseDateID AS Previous_Close_Date_ID,
       TierID AS OTC_Tier_ID,
       SECID AS Security_ID,
       GICSID AS GICS_ID,
       TradingVenueID AS Trading_Venue_ID,
       TotalSharesOutstandingDate AS  Total_Shares_Outstanding_Date,
       ClosingBestBidDateID AS Closing_Best_Bid_Date_ID,
       ClosingBestAskDateID AS Closing_ASK_Bid_Date_ID,
       SourceID AS Source_ID
   FROM joined_fact_cte
)
SELECT *
FROM fact_cte