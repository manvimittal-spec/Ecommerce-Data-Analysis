-- Monthly Orders
SELECT
DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(order_id) AS total_orders
    FROM orders GROUP BY month ORDER BY month;

-- Monthly Revenue
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(p.payment_value) AS revenue
FROM orders o JOIN order_payments p ON o.order_id = p.order_id
GROUP BY month ORDER BY month;

-- Top Customers
SELECT 
    customer_id,
    SUM(p.payment_value) AS total_spent
FROM orders o JOIN order_payments p ON o.order_id = p.order_id
GROUP BY customer_id ORDER BY total_spent DESC LIMIT 10;

-- Average order value 
SELECT 
    SUM(p.payment_value) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o JOIN order_payments p ON o.order_id = p.order_id;

-- Total revenue 
SELECT 
    SUM(payment_value) AS total_revenue FROM order_payments;
    
-- Monthly average order value 
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(p.payment_value) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o JOIN order_payments p ON o.order_id = p.order_id
GROUP BY month ORDER BY month;