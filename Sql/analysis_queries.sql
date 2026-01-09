-- Total sales by store
SELECT Store, SUM(Weekly_Sales) AS total_sales
FROM fact_sales
GROUP BY Store
ORDER BY total_sales DESC;

-- Holiday vs non-holiday sales
SELECT Holiday_Flag, AVG(Weekly_Sales) AS avg_weekly_sales
FROM fact_sales
GROUP BY Holiday_Flag;

-- Monthly seasonality
SELECT MONTH(Date) AS month, SUM(Weekly_Sales) AS monthly_sales
FROM fact_sales
GROUP BY month
ORDER BY month;
