/* =========================================================
   OBJECTIVE 1: EXPLORE THE MENU ITEMS TABLE
   ========================================================= */

SELECT *
FROM menu_items;

SELECT COUNT(*) AS total_menu_items
FROM menu_items;

SELECT item_name, price
FROM menu_items
ORDER BY price DESC;

/* =========================================================
   OBJECTIVE 2: EXPLORE THE ORDERS TABLE
   ========================================================= */

SELECT *
FROM order_details;

SELECT 
    MIN(order_date) AS start_date,
    MAX(order_date) AS end_date
FROM order_details;

/* =========================================================
   OBJECTIVE 3: CUSTOMER BEHAVIOR ANALYSIS
   ========================================================= */

SELECT 
    order_id,
    SUM(price) AS total_spend
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
