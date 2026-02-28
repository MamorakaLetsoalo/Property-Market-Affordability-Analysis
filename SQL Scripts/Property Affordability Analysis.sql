SELECT
    PROPERTY_ID,
    COUNTRY,
    PROVINCE,
    CITY,
    
    -- Core Property Metrics
    PROPERTY_PRICE,
    BEDROOMS,
    BATHROOMS,
    PARKING,
    FLOOR_SIZE,
    
    -- Financial Metrics
    Monthly_Repayment,
    Total_Once_off_Costs,
    Min_Gross_Monthly_Income,
    
    -- Calculated Metrics
    ROUND(PROPERTY_PRICE / NULLIF(FLOOR_SIZE,0), 2) AS Price_Per_SQM,
    
    ROUND(Monthly_Repayment / NULLIF(Min_Gross_Monthly_Income,0), 3) 
        AS Affordability_Ratio,
    
    -- Risk Flag (30% Rule)
    CASE 
        WHEN Monthly_Repayment / NULLIF(Min_Gross_Monthly_Income,0) <= 0.30 
            THEN 'Affordable'
        WHEN Monthly_Repayment / NULLIF(Min_Gross_Monthly_Income,0) BETWEEN 0.30 AND 0.40
            THEN 'Moderate Risk'
        ELSE 'High Risk'
    END AS Affordability_Risk_Level,
    
    -- Income Segmentation
    CASE 
        WHEN Min_Gross_Monthly_Income < 40000 THEN 'Low Income'
        WHEN Min_Gross_Monthly_Income BETWEEN 40000 AND 50000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS Income_Segment,
    
    -- First Time Buyer Indicator
    CASE 
        WHEN Min_Gross_Monthly_Income <= 40000 THEN 'Yes'
        ELSE 'No'
    END AS First_Time_Buyer_Target,
    
    -- Price Band Classification
    CASE 
        WHEN PROPERTY_PRICE < 800000 THEN 'Entry Level'
        WHEN PROPERTY_PRICE BETWEEN 800000 AND 2000000 THEN 'Mid Market'
        ELSE 'Luxury'
    END AS Price_Band,
    
    -- Provincial Ranking 
    RANK() OVER (PARTITION BY PROVINCE 
                 ORDER BY PROPERTY_PRICE DESC) 
        AS Provincial_Price_Rank

FROM property24.default.property_24;