/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - Calculate running totals and moving averages for key metrics.
    - Track cumulative performance over time.
    - Support growth analysis and highlight long-term trends.

SQL Functions Commonly Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales per month
-- and running total of sales over time.

select
order_date,
total_sales,
sum(total_sales) over (order by order_date) as running_sales,
avg(average_price) over (order by order_date) as  moving_average
from(

select 
DATETRUNC(year,order_date) AS order_date,
sum(sales_amount) as total_sales,
avg(price) as average_price
from gold.fact_sales
where order_date is not null
group by DATETRUNC(year,order_date)
)t
