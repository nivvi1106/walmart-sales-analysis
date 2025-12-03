CREATE DATABASE IF NOT EXISTS walmart_sales;
USE walmart_sales;

-- Import the CSV file using "Table Data Import Wizard"

DESCRIBE walmart;
SELECT * FROM walmart LIMIT 10;

-- Changing Date from text to date format
ALTER TABLE walmart 
ADD COLUMN Date_new DATE;

UPDATE walmart 
SET Date_new = STR_TO_DATE(Date, '%d-%m-%Y');

SELECT Date, Date_new 
FROM walmart 
LIMIT 10;

-- Removing the 'Date' column that was in text format
ALTER TABLE walmart 
DROP COLUMN Date;

ALTER TABLE walmart 
CHANGE COLUMN Date_new Date DATE;

-- Checking if 'Date' column is in date format 
DESCRIBE walmart;

