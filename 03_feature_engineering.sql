-- Basic Feature Engineering 
-- Adding year, month, day, week column
ALTER TABLE walmart
ADD COLUMN Year INT,
ADD COLUMN Month INT,
ADD COLUMN Day INT,
ADD COLUMN Week INT;

UPDATE walmart
SET 
    Year = YEAR(Date),
    Month = MONTH(Date),
    Day = DAY(Date),
    Week = WEEK(Date);


-- Adding season column
ALTER TABLE walmart
ADD COLUMN Season VARCHAR(20);

UPDATE walmart
SET Season = CASE 
    WHEN Month IN (12,1,2) THEN 'Winter'
    WHEN Month IN (3,4,5) THEN 'Spring'
    WHEN Month IN (6,7,8) THEN 'Summer'
    WHEN Month IN (9,10,11) THEN 'Fall'
END;


-- Sales Growth % (Shows how much sales increases or decreased compared to previous week per store)
ALTER TABLE walmart
ADD COLUMN Sales_Growth DECIMAL(10,2);

UPDATE walmart w
LEFT JOIN walmart prev
    ON w.Store = prev.Store
    AND w.Date = DATE_ADD(prev.Date, INTERVAL 7 DAY)
SET w.Sales_Growth = 
    CASE 
        WHEN prev.Weekly_Sales IS NULL THEN NULL
        ELSE ((w.Weekly_Sales - prev.Weekly_Sales) / prev.Weekly_Sales) * 100
    END;


-- Rolling 4-Week Average (calculate average weekly sales over the last 4 weeks)
ALTER TABLE walmart
ADD COLUMN Rolling_4_Week_Avg DECIMAL(12,2);

UPDATE walmart w
JOIN (
    SELECT 
        Store,
        Date,
        AVG(Weekly_Sales) OVER (
            PARTITION BY Store
            ORDER BY Date
            RANGE BETWEEN INTERVAL 28 DAY PRECEDING AND CURRENT ROW
        ) AS avg_sales
    FROM walmart
) r
ON w.Store = r.Store AND w.Date = r.Date
SET w.Rolling_4_Week_Avg = r.avg_sales;


-- Store Ranking (ranks stores based on total sales across all weeks)
ALTER TABLE walmart
ADD COLUMN Store_Rank INT;

UPDATE walmart w
JOIN (
    SELECT 
        Store,
        RANK() OVER (ORDER BY SUM(Weekly_Sales) DESC) AS Rank_Total
    FROM walmart
    GROUP BY Store
) AS t
ON w.Store = t.Store
SET w.Store_Rank = t.Rank_Total;


-- Verification
SELECT *
FROM walmart
LIMIT 15;

DESCRIBE walmart;


