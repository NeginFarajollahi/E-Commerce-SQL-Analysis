-- ==================================================================================
-- PROJECT: E-Commerce Data Analysis (Olist Dataset)
-- This file contains advanced SQL queries analyzing sales, logistics, and customer behavior.
-- ==================================================================================


-- ==================================================================================
-- CHALLENGE 1: Identifying Logistics Bottlenecks
-- Business Question: Which 5 Brazilian states have the slowest average delivery times?
-- ==================================================================================
-- Logic: 
-- 1. Joined 'orders' and 'customers' to map delivery dates to customer locations.
-- 2. Used julianday() to calculate the exact difference in days between purchase and delivery.
-- 3. Filtered out NULL delivery dates (canceled/lost orders) to prevent math errors.

SELECT
    c.customer_state,
    ROUND(AVG(julianday(o.order_delivered_customer_date) - julianday(o.order_purchase_timestamp)), 2) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC
LIMIT 5;


-- ==================================================================================
-- CHALLENGE 2: Identifying VIP Customers (Top Spenders)
-- Business Question: Who are the top 10 most valuable customers by total revenue?
-- ==================================================================================
-- Logic:
-- 1. Joined 3 tables (customers -> orders -> order_payments) to link individuals to their payments.
-- 2. Used COUNT(DISTINCT order_id) instead of standard COUNT(). This prevents the bug of 
--    double-counting a single order if the customer paid using multiple payment methods 
--    (e.g., split between credit card and a voucher).

SELECT 
    c.customer_unique_id,
    ROUND(SUM(op.payment_value), 2) AS total_spent,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = c.customer_id
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;


-- ==================================================================================
-- CHALLENGE 3: Premium Products Leaderboard (Window Functions)
-- Business Question: What is the single most expensive product in each category?
-- ==================================================================================
-- Logic:
-- 1. Used a Common Table Expression (CTE) to create a temporary ranked table.
-- 2. Used ROW_NUMBER() OVER(PARTITION BY category ORDER BY price DESC) to 
--    isolate and rank products within their specific categories.
-- 3. Filtered the CTE for rank = 1 to extract only the top premium product per category.

WITH RankedProducts AS (
    SELECT 
        pt.product_category_name_english,
        oi.product_id,
        oi.price,
        ROW_NUMBER() OVER(PARTITION BY pt.product_category_name_english ORDER BY oi.price DESC) as rank
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN product_category_name_translation pt ON p.product_category_name = pt.product_category_name
)
SELECT 
    product_category_name_english,
    product_id,
    price
FROM RankedProducts
WHERE rank = 1;
