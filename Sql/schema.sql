CREATE DATABASE walmart_retail;
USE walmart_retail;	

CREATE TABLE fact_sales (
    Store INT,
    Date DATE,
    Weekly_Sales DECIMAL(12,2),
    Holiday_Flag INT,
    Temperature DECIMAL(5,2),
    Fuel_Price DECIMAL(5,2),
    CPI DECIMAL(6,2),
    Unemployment DECIMAL(5,2)
);

select * from fact_sales;

select
    sum(Weekly_Sales) as total_sales,
    avg(Weekly_Sales) as avg_weekly_sales
from fact_sales;

select
	store,
	sum(weekly_sales) as total_sales
from fact_sales
group by store
order by total_sales desc;

select
    Date,
    sum(Weekly_Sales) as weekly_total
from fact_sales
group by Date
order by Date;

select
    Holiday_Flag,
    avg(Weekly_Sales) as avg_sales
from fact_sales
group by Holiday_Flag;

select
    date_format(Date, '%Y-%m') as month,
    sum(Weekly_Sales) as monthly_sales
from fact_sales
group by month
order by month;

create view store_performance as
select
    Store,
    sum(Weekly_Sales) as total_sales,
    Avg(Weekly_Sales) as avg_weekly_sales,
    STDDEV(Weekly_Sales) as sales_volatility
from fact_sales
group by Store;

select * from store_performance;

create view weekly_sales_trend as 
select
	date,
    sum(weekly_sales) as weekly_sales
from fact_sales
group by Date
order by Date;

select * from weekly_sales_trend;

create view holiday_impact as 
select 
	holiday_flag,
    avg(weekly_sales) as avg_sales,
    sum(weekly_sales) as total_sales
from fact_sales
group by holiday_Flag;
    
select * from holiday_impact;

create view monthly_seasonality as
select
	year(date) as year,
    month(date) as month,
    sum(weekly_sales) as monthly_sales
from fact_sales
group by year, month
order by year, month;

select * from monthly_seasonality;
