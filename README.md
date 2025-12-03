# Walmart Sales Analysis 

A comprehensive Exploratory Data Analysis (EDA) of Walmart’s sales data using MySQL.  
This project analyzes store performance, sales trends, seasonal behavior, and the impact of holidays on weekly sales.  
It demonstrates SQL-based data cleaning, feature engineering, and analytical querying.

---

## **Project Overview**

The goal of this project is to identify key patterns and insights in Walmart’s retail sales dataset.  
The analysis answers questions such as:

- Which stores perform best and worst?
- How do sales vary by year, month, week, and season?
- How much impact do holidays have on store performance?
- Which stores are growing the fastest?
- When were the best and worst sales months?

This project uses **pure SQL**, following a complete workflow:
1. Data import  
2. Cleaning & preprocessing  
3. Feature engineering  
4. Exploratory data analysis (EDA)  

---

## **Dataset Used**

**Kaggle Dataset:**  
🔗 https://www.kaggle.com/datasets/yasserh/walmart-dataset

The dataset contains 6,435 weekly observations from multiple Walmart stores with features such as:

- `Weekly_Sales`
- `Holiday_Flag`
- `Temperature`
- `Fuel_Price`
- `CPI`
- `Unemployment`
- `Date` (converted to proper DATE type)

---

## **Project Workflow (SQL Scripts)**


### **01_setup_and_import.sql**
- Create database  
- Import CSV  
- Convert `Date` from TEXT → DATE  
- Basic validation checks  

### **02_data_cleaning.sql**
- Check missing values  
- Check duplicates  
- Validate ranges (temperature, CPI, unemployment)  

### **03_feature_engineering.sql**
Creates analytical features:
- Add Year, Month, Day, Week  
- Add Season column  
- Week-over-week **Sales Growth %**  
- **Rolling 4-Week Average Sales**  
- **Store Ranking** based on total sales  

### **04_EDA_queries.sql**
Main exploratory analysis:
- Store-level performance  
- Yearly, monthly & seasonal trends  
- Holiday vs non-holiday sales  
- Growth & consistency insights  
- Best & worst months  

---

## **Key Questions Answered (EDA)**

### **Store Performance**
- Which stores generate the highest total sales?
- What is the average weekly sales per store?
- Top 5 and bottom 5 stores  
- Yearly sales breakdown per store  

### **Trend Analysis**
- Year-over-year total sales  
- Monthly sales variation  
- Seasonal sales trends (Winter, Spring, Summer, Fall)  
- Weekly sales pattern (week 1–52)  

### **Holiday Impact**
- Holiday-week vs non-holiday-week sales  
- Stores most impacted (positively) by holidays  
- Percentage increase in holiday-week sales  

### **High-Value Insights**
- Fastest-growing stores (avg growth %)  
- Best month overall  
- Worst month overall  
- Stores with highest rolling average (consistent performers)  

---

## **Technologies Used**

| Tool | Purpose |
|------|----------|
| **MySQL Workbench** | Querying, analysis, and data modeling |
| **MySQL 8+** | Window functions, ranking, rolling averages |
| **Kaggle Dataset** | Real-world sales data |
| **SQL** | Cleaning, transformation, analytics |

---


---

## 🚀 **How to Run This Project**

1. Download the dataset from Kaggle  
2. Open MySQL Workbench  
3. Run the scripts in this order:
   - `01_setup_and_import.sql`
   - `02_data_cleaning.sql`
   - `03_feature_engineering.sql`
   - `04_EDA_queries.sql`
4. Observe outputs and insights directly in Workbench  

---

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



