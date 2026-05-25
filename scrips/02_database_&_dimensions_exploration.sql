/*
===============================================================================
Database & Dimensions Exploration
===============================================================================
Purpose:
    - To examine the overall structure of the database, including tables and schemas.
    - To review columns and metadata for specific tables.
    - To analyze the structure of dimension tables for deeper insights.

System Views Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS

SQL Functions Applied:
    - DISTINCT
    - ORDER BY
===============================================================================
*/
--  Explore all objects in Database

select * from INFORMATION_SCHEMA.Tables

-- Explore all columns in the Database
select * from INFORMATION_SCHEMA.columns
 where table_name= 'dim_customers';

-- Explore all countries our customer come from
select distinct country from gold.dim_customers;

-- Explore all Categories " The major Divisons"
select distinct category, subcategory, product_name from gold.dim_products
order by 1, 2 ,3 ; 

