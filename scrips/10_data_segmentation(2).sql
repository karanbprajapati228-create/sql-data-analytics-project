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


/* Group customers into three segments based on their spending behavior :
   - VIP: Customers with at least 12 months of history and spending more than $5,000.
   - Regular : Customers with at least 12 months of history but spending $5,000 or less.
   - New : Customers with a lifespan less than 12 months.
   And find the total number of customers by each group
*/

with customer_spending as (
select 
c.customer_key,
sum(f.sales_amount) as total_spending,
min(f.order_date) as first_order,
max(f.order_date) as last_order,
DATEDIFF(month,min(f.order_date), max(f.order_date)) as lifespan 
from gold.fact_sales f
left join gold.dim_customers c
on f.customer_key=c.customer_key
group by c.customer_key)

select
customer_segment,
count(customer_key)
from(
select
customer_key,
case when lifespan >=12 and total_spending >5000 then 'VIP'
     when lifespan >=12 and total_spending <=5000 then 'Regular'
     else 'New'
end AS Customer_segment
from customer_spending
)t
group by Customer_segment
