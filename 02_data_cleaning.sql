-- Checking total number of rows
SELECT COUNT(*) AS total_rows
FROM walmart;

-- Checking for missing values in each column
SELECT 
    SUM(CASE WHEN Store IS NULL THEN 1 END) AS missing_store,
    SUM(CASE WHEN Date IS NULL THEN 1 END) AS missing_date,
    SUM(CASE WHEN Weekly_Sales IS NULL THEN 1 END) AS missing_weekly_sales,
    SUM(CASE WHEN Holiday_Flag IS NULL THEN 1 END) AS missing_holiday_flag,
    SUM(CASE WHEN Temperature IS NULL THEN 1 END) AS missing_temperature,
    SUM(CASE WHEN Fuel_Price IS NULL THEN 1 END) AS missing_fuel_price,
    SUM(CASE WHEN CPI IS NULL THEN 1 END) AS missing_cpi,
    SUM(CASE WHEN Unemployment IS NULL THEN 1 END) AS missing_unemployment
FROM walmart;

-- Checking for duplicate rows
SELECT 
    Store, Date, Weekly_Sales, Holiday_Flag, Temperature, 
    Fuel_Price, CPI, Unemployment, COUNT(*) AS count
FROM walmart
GROUP BY 
    Store, Date, Weekly_Sales, Holiday_Flag, Temperature, 
    Fuel_Price, CPI, Unemployment
HAVING COUNT(*) > 1;


-- Feature Engineering 

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


-- Verification
SELECT * FROM walmart limit 10;
DESCRIBE walmart;



