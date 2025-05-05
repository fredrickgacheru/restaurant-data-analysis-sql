USE restaurant_db;


-- Combine the menu-items and order_details tables into a single table
CREATE TABLE detailed_orders AS
SELECT 
    order_details.*,          -- Select all columns from order_details
    menu_items.item_name,     -- Select item_name from menu_items
    menu_items.category,      -- Select category from menu_items
    menu_items.price          -- Select price from menu_items
FROM 
    order_details
LEFT JOIN 
    menu_items
ON 
    order_details.item_id = menu_items.menu_item_id;  -- Match item_id from order_details with menu_item_id from menu_items

-- What were the least and most ordered items? What categories were they in?
SELECT * FROM detailed_orders;

SELECT item_name, COUNT(item_name) AS count, category
FROM detailed_orders
GROUP By item_name, category
ORDER BY count DESC
LIMIT 1;

SELECT * FROM detailed_orders;
SELECT item_name, COUNT(*) AS count, category
FROM detailed_orders
GROUP By item_name, category
ORDER BY count
LIMIT 1;

-- top ordered categories
SELECT * FROM detailed_orders;

SELECT category, COUNT(category) as count
FROM detailed_orders
GROUP By category
ORDER BY count DESC;

-- What were the top five orders that spent the most money?
SELECT 
	order_id,                     
    SUM(price) AS total_price   
FROM detailed_orders
GROUP BY order_id
ORDER BY total_price DESC
LIMIT 5;	

-- view the details of the highest spend order. What Insights can you gather from the results?
SELECT * FROM detailed_orders 
WHERE order_id = '440'
ORDER BY category;

SELECT category, COUNT(category) as dishes_category FROM detailed_orders 
WHERE order_id = '440'
GROUP BY category;

SELECT item_name, COUNT(*) AS item_category
FROM detailed_orders
WHERE order_id = '440'
GROUP BY item_name
ORDER BY item_category DESC;

-- Bonus: View the details of the top 5 highest spend orders. What insights can you gather from the results?
SELECT category, COUNT(category) FROM detailed_orders 
WHERE order_id IN
(SELECT order_id
FROM
	(SELECT 
		order_id,                     
		SUM(price) AS total_price   
	FROM detailed_orders
	GROUP BY order_id
	ORDER BY total_price DESC
	LIMIT 5) AS top_orders)
GROUP BY category
ORDER BY COUNT(category) DESC;	

SELECT order_id, category, COUNT(category) FROM detailed_orders 
WHERE order_id IN
(SELECT order_id
FROM
	(SELECT 
		order_id,                     
		SUM(price) AS total_price   
	FROM detailed_orders
	GROUP BY order_id
	ORDER BY total_price DESC
	LIMIT 5) AS top_orders)
GROUP BY order_id, category
ORDER BY order_id, COUNT(category) DESC;	