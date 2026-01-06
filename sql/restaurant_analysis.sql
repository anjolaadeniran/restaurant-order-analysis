/* =========================================================
   RESTAURANT ORDER ANALYSIS
   =========================================================
   This SQL file explores menu performance, order behavior,
   and high-value customer orders.
   ========================================================= */


/* =========================================================
   OBJECTIVE 1: EXPLORE THE ORDERS TABLE
   ========================================================= */

/* View the order details table */
SELECT *
FROM order_details;

/* Identify the date range of the orders */
SELECT 
    MIN(order_date) AS start_date,
    MAX(order_date) AS end_date
FROM order_details;

/* Count the total number of unique orders */
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM order_details;

/* Identify orders with the highest number of items */
SELECT 
    order_id,
    COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;


/* =========================================================
   OBJECTIVE 2: LARGE ORDER ANALYSIS
   ========================================================= */

/* Count how many orders had more than 12 items (subquery approach) */
SELECT COUNT(*) AS num_large_orders
FROM (
    SELECT 
        order_id,
        COUNT(item_id) AS num_items
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
) AS num_orders;

/* Count how many orders had more than 12 items (CTE approach) */
WITH orders_with_many_items AS (
    SELECT 
        order_id,
        COUNT(item_id) AS num_items
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
)
SELECT COUNT(*) AS num_orders
FROM orders_with_many_items;


/* =========================================================
   OBJECTIVE 3: COMBINE MENU AND ORDER DATA
   ========================================================= */

/* Join menu items with order details */
SELECT *
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id;


/* =========================================================
   OBJECTIVE 4: ITEM POPULARITY ANALYSIS
   ========================================================= */

/* Identify the most and least ordered items and their categories */
SELECT 
    item_name,
    category,
    COUNT(order_details_id) AS total_purchases
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY total_purchases DESC;


/* =========================================================
   OBJECTIVE 5: HIGH-VALUE ORDER ANALYSIS
   ========================================================= */

/* Identify the top 5 highest-spend orders */
SELECT 
    order_id,
    SUM(price) AS total_spend
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;

/* Analyze category composition of the highest-spend order */
SELECT 
    category,
    COUNT(item_id) AS total_items
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

/* Analyze category composition of the top 5 highest-spend orders */
SELECT 
    order_id,
    category,
    COUNT(item_id) AS total_items
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;
