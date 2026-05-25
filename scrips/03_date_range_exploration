/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - Identify the time boundaries of key data points.
    - Assess the overall span and coverage of historical records.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/
-- Find the date of first and last order
-- How many years of sales are avaiable
Select min(order_date) as first_order_date,
max(order_date) as last_order_date,
DATEDIFF(year,min(order_date),max(order_date))  AS order_range_years
from gold.fact_sales;


-- Find the youngest and the oldest customers

Select min(birthdate) as oldest_birthdate,
DATEDIFF(year,min(birthdate),getdate()) as oldest_age,
max(birthdate) as youngest_birthdate,
DATEDIFF(year,max(birthdate),getdate()) as youngest_age
from gold.dim_customers;
