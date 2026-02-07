-- #6 Ranking (order the values of dimensions by measure.)
-- Which 5 products generate the highest revenue?
SELECT 
p.product_name,
SUM(s.sales_amount) AS revenue
FROM dim_products p
JOIN fact_sales s
ON p.product_key = s.product_key
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
;


-- What are the 5 worst-performing products in terms of sales?
WITH CTE AS(
SELECT 
p.product_name,
SUM(s.sales_amount) AS total_sales,
DENSE_RANK() OVER(ORDER BY SUM(s.sales_amount) ASC) AS rnk
FROM dim_products p
JOIN fact_sales s
ON p.product_key = s.product_key
GROUP BY 1
)
SELECT
product_name,
total_sales
FROM CTE 
WHERE rnk <= 5
;


-- Find the Top-10 customers who have generated the highest revenue and 3 customers with the fewest orders placed.
-- Find the Top-10 customers who have generated the highest revenue
WITH CTE AS(
SELECT 
c.customer_key,
c.first_name,
SUM(s.sales_amount) AS revenue,
RANK() OVER(ORDER BY SUM(s.sales_amount) DESC) AS rnk
FROM dim_customers c
JOIN fact_sales s
ON c.customer_key = s.customer_key
GROUP BY 1,2
)
SELECT 
customer_key,
first_name,
revenue,
rnk
FROM CTE
WHERE rnk <= 10
;

-- 3 customers with the fewest orders placed.
WITH CTE AS(
SELECT 
c.customer_key,
c.first_name,
COUNT(s.order_number) AS order_counts,
RANK() OVER(ORDER BY COUNT(s.order_number) ASC) AS rnk
FROM dim_customers c
JOIN fact_sales s
ON c.customer_key = s.customer_key
GROUP BY 1,2
)
SELECT
customer_key,
first_name,
order_counts,
rnk
FROM CTE
WHERE rnk <= 3
;