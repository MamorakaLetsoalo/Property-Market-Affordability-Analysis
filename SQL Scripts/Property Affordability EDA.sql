select * from `property24`.`default`.`property_24` limit 10;

--Data Cleaning
SELECT *
FROM `property24`.`default`.`property_24`
WHERE PROPERTY_PRICE IS NULL
   OR Monthly_Repayment IS NULL
   OR Total_Once_off_Costs IS NULL
   OR Min_Gross_Monthly_Income IS NULL;

--Affordability Ratio with once off cost (Below 0.35)
SELECT *
FROM `property24`.`default`.`property_24`
WHERE (Monthly_Repayment + Total_Once_off_Costs)/Min_Gross_Monthly_Income < 0.35;

--Affordability Ratio  with once off costs (Above 0.35)
SELECT *
FROM `property24`.`default`.`property_24`
WHERE (Monthly_Repayment + Total_Once_off_Costs)/Min_Gross_Monthly_Income > 0.35;

--Affordability Ratio without once off costs 
SELECT *, Monthly_Repayment / Min_Gross_Monthly_Income AS Affordability_Ratio
FROM `property24`.`default`.`property_24`;

--Provincial averages and Affordability ranking 
SELECT 
    PROVINCE,
    AVG(PROPERTY_PRICE) AS Avg_Price,
    AVG(Monthly_Repayment) AS Avg_Repayment,
    AVG(Min_Gross_Monthly_Income) AS Avg_Income_Required,
    AVG(Monthly_Repayment / Min_Gross_Monthly_Income) AS Avg_Affordability_Ratio
FROM `property24`.`default`.`property_24`
GROUP BY PROVINCE
ORDER BY Avg_Affordability_Ratio ASC;

--Overstreched cities
SELECT 
    CITY,
    COUNT(*) AS Total_Properties,
    SUM(CASE WHEN Monthly_Repayment / Min_Gross_Monthly_Income > 0.35 THEN 1 ELSE 0 END) AS High_Risk_Properties,
    SUM(CASE WHEN Monthly_Repayment / Min_Gross_Monthly_Income < 0.35 THEN 1 ELSE 0 END) AS Low_Risk_Properties,
    ROUND(
        SUM(CASE WHEN Monthly_Repayment / Min_Gross_Monthly_Income > 0.35 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS High_Risk_Percentage,
    ROUND(
        SUM(CASE WHEN Monthly_Repayment / Min_Gross_Monthly_Income < 0.35 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS Low_Risk_Percentage
FROM `property24`.`default`.`property_24`
GROUP BY CITY
ORDER BY High_Risk_Percentage DESC;

--Average Price per Square meter
SELECT 
    PROVINCE, 
    round(AVG(PROPERTY_PRICE / FLOOR_SIZE), 2) AS AVG_Price_Per_SQM
FROM `property24`.`default`.`property_24`
GROUP BY PROVINCE
ORDER BY AVG_Price_Per_SQM DESC;

--Affordable houses for low income earners
SELECT *
FROM `property24`.`default`.`property_24`
WHERE Min_Gross_Monthly_Income <= 40000;

--
SELECT *,
    CASE 
        WHEN Min_Gross_Monthly_Income < 40000 THEN 'Low Income'
        WHEN Min_Gross_Monthly_Income BETWEEN 40000 AND 60000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS Income_Segment
FROM `property24`.`default`.`property_24`;
