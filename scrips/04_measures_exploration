/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - Compute summary statistics such as totals, averages, and other aggregates 
      to provide quick insights.
    - Detect overall trends and highlight potential anomalies in the data.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/
-- Find the Total Sales

select sum(sales_amount) AS Total_sales from gold.fact_sales;

-- Find how many items are sold

select sum(quantity) AS Total_quantity from gold.fact_sales;

-- Finding the average selling price
select avg (price) AS avg_price from gold.fact_sales;

-- Find the total number of Orders
select count(order_number) as total_orders from gold.fact_sales;
select count(distinct order_number) as total_orders from gold.fact_sales;

-- Find the total number of Products
select count( product_key) as total_products from gold.dim_products

-- Find the total number of Customers
select count( customer_key) as total_customers from gold.dim_customers

-- Find the total number of Customers that has placed an orders
select count(distinct customer_key) as total_customers from gold.fact_sales



-- Generate Report that shows all key matrics of the business

select 'Total Sales' AS measure_name, sum(sales_amount) AS measure_value from gold.fact_sales
union all 
select 'Total Quantity' , sum(quantity)  from gold.fact_sales
union all
select 'Average Price' , avg(price)  from gold.fact_sales
union all 
select 'Total Nr. Orders' , count(distinct order_number)  from gold.fact_sales
union all
select 'Total Nr. Products' , count(product_key)  from gold.dim_products
union all
select 'Total Nr. customers' , count( customer_key)  from gold.dim_customers;
