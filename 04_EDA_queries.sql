-- Store Level Analysis (Identify performance differences across stores)

-- 1. Total sales per store (descending)
SELECT Store, ROUND(SUM(Weekly_Sales),2) AS Total_Store_Sales
FROM walmart
GROUP BY Store
ORDER BY Total_Store_Sales DESC;

-- 2. Average weekly sales per store
SELECT Store, ROUND(AVG(Weekly_Sales),2) AS Avg_Weekly_Sales
FROM walmart
GROUP BY Store
ORDER BY Avg_Weekly_Sales DESC;

-- 3. Top 5 performing stores (by total sales)
SELECT Store, ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Store
ORDER BY Total_Sales DESC
LIMIT 5;

-- 4. Bottom 5 performing stores (by total sales)
SELECT Store, ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Store
ORDER BY Total_Sales ASC
LIMIT 5;

-- 5. Yearly sales for each store
SELECT Store, Year, ROUND(SUM(Weekly_Sales),2) AS Yearly_Sales
FROM walmart
GROUP BY Store, Year
ORDER BY Store, Year;



-- Trend Analysis (Understand demand cycles and sales patterns)

-- 1. Total sales per year
SELECT Year, ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Year
ORDER BY Year;

-- 2. Total sales per month across all stores
SELECT Year, Month, ROUND(SUM(Weekly_Sales),2) AS Monthly_Sales
FROM walmart
GROUP BY Year, Month
ORDER BY Year, Month;

-- 3. Total sales by season
SELECT Season, ROUND(SUM(Weekly_Sales),2) AS Seasonal_Sales
FROM walmart
GROUP BY Season
ORDER BY Seasonal_Sales DESC;

-- 4. Weekly sales trend (week number 1–52)
SELECT Week, ROUND(SUM(Weekly_Sales),2) AS Weekly_Sales
FROM walmart
GROUP BY Week
ORDER BY Week;



-- HOLIDAY VS NON-HOLIDAY SALES IMPACT

-- 1. Average holiday week sales vs non-holiday week sales
SELECT 
    Holiday_Flag,
    ROUND(AVG(Weekly_Sales),2) AS Avg_Sales
FROM walmart
GROUP BY Holiday_Flag;

-- 2. Stores with highest holiday-week sales
SELECT Store, ROUND(SUM(Weekly_Sales),2) AS Holiday_Sales
FROM walmart
WHERE Holiday_Flag = 1
GROUP BY Store
ORDER BY Holiday_Sales DESC;

-- 3. Stores most impacted by holidays (% increase)
SELECT 
    Store,
    ROUND(
        (AVG(CASE WHEN Holiday_Flag = 1 THEN Weekly_Sales END) -
         AVG(CASE WHEN Holiday_Flag = 0 THEN Weekly_Sales END))
         /
         AVG(CASE WHEN Holiday_Flag = 0 THEN Weekly_Sales END)
        * 100, 2
    ) AS Holiday_Impact_Percent
FROM walmart
GROUP BY Store
ORDER BY Holiday_Impact_Percent DESC;



-- High value insights (strategic findings- growth, volatility, best & worst periods)

-- 1. Fastest growing stores (highest avg Sales_Growth)
SELECT 
    Store,
    ROUND(AVG(Sales_Growth),2) AS Avg_Growth_Percent
FROM walmart
GROUP BY Store
ORDER BY Avg_Growth_Percent DESC;

-- 2. Best sales month overall
SELECT 
    Year, Month, ROUND(SUM(Weekly_Sales),2) AS Monthly_Sales
FROM walmart
GROUP BY Year, Month
ORDER BY Monthly_Sales DESC
LIMIT 1;

-- 3. Worst sales month overall
SELECT 
    Year, Month, ROUND(SUM(Weekly_Sales),2) AS Monthly_Sales
FROM walmart
GROUP BY Year, Month
ORDER BY Monthly_Sales ASC
LIMIT 1;

-- 4. Highest rolling 4-week average store (best consistent performance)
SELECT Store, MAX(Rolling_4_Week_Avg) AS Peak_Rolling_Avg
FROM walmart
GROUP BY Store
ORDER BY Peak_Rolling_Avg DESC;


