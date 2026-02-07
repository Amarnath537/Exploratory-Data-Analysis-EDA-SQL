-- #3 Date Exploration
-- Find the date of first and last order 
(SELECT MIN(order_date)AS order_date, 'first_order' AS comment FROM fact_sales)
UNION
(SELECT MAX(order_date)AS order_date, 'last_order' AS comment FROM fact_sales)
;

-- How many years of sales are available
SELECT
MIN(order_date) AS first_Order_date,
MAX(order_date) AS last_Order_date,
ROUND(DATEDIFF(MAX(order_date), MIN(order_date))/365.25, 2) AS num_years_data   -- 365.25 Accounts for leap years, Industry-standard approximation
FROM fact_sales
;

-- Find the youngest and oldest customer
SELECT 
MIN(birthdate) AS oldest_birthdate,
TIMESTAMPDIFF(year, MIN(birthdate), CURDATE()) AS oldest_cust_age,
MAX(birthdate) AS youngest_birthdate,
TIMESTAMPDIFF(year, MAX(birthdate), CURDATE()) AS youngest_cust_age
FROM dim_customers
;
