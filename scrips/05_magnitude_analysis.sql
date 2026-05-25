/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - Quantify data by grouping results across defined dimensions.
    - Examine how values are distributed within categories to reveal patterns 
      and insights.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/
-- Find the total number of Customers by Countries
select
country,
count( customer_key) as total_customers 
from gold.dim_customers
group by country
order by total_customers desc;

-- Find the total customer by gender
select
gender,
count( customer_key) as total_customers 
from gold.dim_customers
group by gender
order by total_customers desc;

-- Find total products by category
select
category,
count(product_key) as total_products 
from gold.dim_products
group by category
order by total_products desc;

--- What is the average costs in each category

select
category,
avg(cost) as average_cost 
from gold.dim_products
group by category
order by average_cost desc;


-- what is the total revenue generated for each category?

select
pr.category,
sum(f.sales_amount) as Total_Revenue
from gold.fact_sales f
left join gold.dim_products pr
on pr.product_key=f.product_key
group by category
order by Total_Revenue desc;

-- what is the total revenue generated for each customer?
select
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) as Total_Revenue
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key=f.customer_key
group by
c.customer_key,
c.first_name,
c.last_name
order by Total_Revenue desc;

-- what is the distribution of sold items in across countries

select
c.country,
sum(f.quantity) as Total_Sold_items
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key=f.customer_key
group by 
c.country
order by Total_Sold_items desc;


