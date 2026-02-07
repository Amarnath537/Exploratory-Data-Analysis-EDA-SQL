-- #2 Dimensions Exploration

-- Explore All countries our customers come from.
SELECT 
DISTINCT country
FROM dim_customers
;

-- Explore All Product Categories 'The Major Divisions'
SELECT 
DISTINCT category,
subcategory,
product_name
FROM dim_products
WHERE category IS NOT Null
ORDER BY 1,2,3
;