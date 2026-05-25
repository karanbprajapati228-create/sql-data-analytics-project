/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - Monitor trends, growth, and changes in key metrics over time.
    - Perform time-series analysis to uncover seasonality and recurring patterns.
    - Measure growth or decline across defined periods for actionable insights.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/
-- Analyze Sales Performance over time
-- Quick Date Functions

select
year(order_date) as order_year,
month(order_date) as order_Month,
sum(sales_amount) AS Total_sales,
count(distinct customer_key) As Total_customers,
sum(quantity) AS Total_quantity
from gold.fact_sales
where order_date is not null
group by year(order_date),month(order_date)
order by year(order_date),month(order_date);

-- DATETRUNC()

select
datetrunc(month,order_date) as order_date,
sum(sales_amount) AS Total_sales,
count(distinct customer_key) As Total_customers,
sum(quantity) AS Total_quantity
from gold.fact_sales
where order_date is not null
group by datetrunc(month,order_date)
order by datetrunc(month,order_date);

--FORMATE()

select
format(order_date,'yyyy-MMM') as order_date,
sum(sales_amount) AS Total_sales,
count(distinct customer_key) As Total_customers,
sum(quantity) AS Total_quantity
from gold.fact_sales
where order_date is not null
group by format(order_date,'yyyy-MMM') 
order by format(order_date,'yyyy-MMM') ;
