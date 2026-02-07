-- #4 Measures Exploration
-- Calculate the key metric of the business (Big Numbers)

-- Find the Total Sales
SELECT
SUM(sales_amount) AS total_sales
FROM fact_sales
;


-- Find how many items are sold
SELECT 
SUM(quantity) AS total_quantity
FROM fact_sales
;


-- Find the average selling price
SELECT
ROUND(AVG(price), 2) AS average_price
FROM fact_sales
;


-- Find the total number of orders
SELECT
COUNT(DISTINCT order_number) AS total_orders
FROM fact_sales
;


-- Find the total number of products
SELECT
COUNT(DISTINCT product_key) AS total_num_products
FROM dim_products
;

-- Find the total number of customers
SELECT
COUNT(DISTINCT customer_key) AS total_num_customers
FROM dim_customers
;

-- Find the total number of customers that has placed an order
SELECT
COUNT(DISTINCT customer_key) AS total_num_cust_order_placed
FROM fact_sales
;


-- Generate Report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM fact_sales
UNION ALL
SELECT 'Total Quantity' AS measure_name, SUM(quantity) AS measure_value FROM fact_sales
UNION ALL
SELECT 'Average Price' AS measure_name, ROUND(AVG(price), 2) AS measure_value FROM fact_sales
UNION ALL
SELECT 'Total Num Orders' AS measure_name, COUNT(DISTINCT order_number) AS measure_value FROM fact_sales
UNION ALL
SELECT 'Total Num Products' AS measure_name, COUNT(DISTINCT product_key) AS measure_value FROM dim_products
UNION ALL
SELECT 'Total Num Customers' AS measure_name, COUNT(DISTINCT customer_key) AS measure_value FROM dim_customers
;
