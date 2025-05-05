USE restaurant_db;

-- EXLORE THE ORDERS TABLE
-- 1. View the order_details table. What is the date range of the table?
SELECT * FROM order_details;
SELECT * FROM order_details;

SELECT MIN(order_date) AS earliest_date,
       MAX(order_date) AS latest_date
FROM order_details;

-- 2. How many orders were made within this date range? How many items were ordered within this date range?
-- Number of items ordered
SELECT 
  order_date,
  COUNT(*) AS items_per_date,
  SUM(COUNT(*)) OVER (ORDER BY order_date) AS items_running_total
FROM order_details
GROUP BY order_date
ORDER BY order_date;

-- Number of orders
SELECT 
	order_date, 
	COUNT(DISTINCT order_id) AS number_of_orders,
    SUM(COUNT(DISTINCT order_id)) OVER (ORDER BY order_date) AS orders_running_total
FROM order_details
GROUP BY order_date
ORDER BY order_date;

-- 3. Which orders had the most number of items?
SELECT 
	DISTINCT order_id as order_,
    COUNT(item_id) as number_of_items
FROM order_details
GROUP BY order_
ORDER BY number_of_items DESC;     

-- average order items
SELECT AVG(number_of_items) AS mean_number_of_items
FROM (
    SELECT order_id, COUNT(item_id) AS number_of_items
    FROM order_details
    GROUP BY order_id
) AS order_counts;

--  Mode (most number ordered)
SELECT number_of_items
FROM (
    SELECT COUNT(item_id) AS number_of_items
    FROM order_details
    GROUP BY order_id
) AS order_counts
GROUP BY number_of_items
ORDER BY COUNT(*) DESC
LIMIT 1;

  

-- How many orders had more than 12 items?
SELECT COUNT(*) AS number_of_big_orders
FROM (
  SELECT 
    order_id,
    COUNT(*) AS number_of_items
  FROM order_details
  GROUP BY order_id
  HAVING number_of_items > 12
) AS num_orders;


