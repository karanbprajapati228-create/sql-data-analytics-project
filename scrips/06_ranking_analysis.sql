/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/
-- Which 5 products generate the highest revenue
-- Simple Ranking

select top 5
pr.product_name,
sum(f.sales_amount) AS Total_revenue
from gold.fact_sales f
left join gold.dim_products pr
on f.product_key=pr.product_key
group by pr.product_name
order by Total_revenue desc;

--Complex but Flexibly Ranking Using Window Functions

select*from(
		select 
		pr.product_name,
		sum(f.sales_amount) AS Total_revenue,
		rank() over (order by sum(f.sales_amount) desc) AS rank_product
		from gold.fact_sales f
		left join gold.dim_products pr
		on f.product_key=pr.product_key
		group by pr.product_name) t
where rank_product <=5

-- What are the 5 worst-performing products in the terms of sales


select top 5
pr.product_name,
sum(f.sales_amount) AS Total_revenue
from gold.fact_sales f
left join gold.dim_products pr
on f.product_key=pr.product_key
group by pr.product_name
order by Total_revenue ;


-- Find the top-10 customers who generated the highest revenue 

select top 10
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

-- and 3 customers with the fewest orders placed

select top 3
c.customer_key,
c.first_name,
c.last_name,
count(distinct f.order_number) as Total_orders
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key=f.customer_key
group by
c.customer_key,
c.first_name,
c.last_name
order by Total_orders ;
