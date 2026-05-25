/*
===============================================================================
Data Segmentation Analysis
===============================================================================
Purpose:
    - Organize data into meaningful categories for targeted insights.
    - Support customer segmentation, product grouping, and regional comparisons.

SQL Functions Commonly Used:
    - CASE: Define custom segmentation rules.
    - GROUP BY: Aggregate results by segment.
===============================================================================
*/

/* Segment products into cost ranges and
count how many products fall into each segment */

with product_sagment as(
select 
product_key,
product_name,
cost,
case when cost < 100 then 'Below 100'
     when cost<500 then '100-500'
     when cost<1000 then '500-1000'
     else 'above 1000'
end cost_range
from gold.dim_products)

select
cost_range,
count(product_key)  as Total_products
from product_sagment
group by cost_range
order by Total_products desc
