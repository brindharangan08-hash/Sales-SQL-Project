-- 1. Total revenue (only completed orders)
SELECT SUM(o.total_amount) AS total_revenue
FROM orders o
WHERE o.status = 'completed';

-- 2. Revenue by customer
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS customer_name, SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.customer_id
ORDER BY revenue DESC;

-- 3. Top selling products by quantity
SELECT p.product_id, p.name, SUM(oi.quantity) AS total_qty
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY p.product_id
ORDER BY total_qty DESC;

-- 4. Average order value (AOV)
SELECT AVG(o.total_amount) AS average_order_value
FROM orders o
WHERE o.status = 'completed';

-- 5. Orders per city
SELECT c.city, COUNT(o.order_id) AS orders_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.city
ORDER BY orders_count DESC;

-- 6. Monthly revenue using CTE
WITH monthly AS (
  SELECT substr(order_date,1,7) AS month, SUM(total_amount) AS revenue
  FROM orders
  WHERE status = 'completed'
  GROUP BY month
)
SELECT * FROM monthly ORDER BY month;

-- 7. Running total with window function
WITH monthly AS (
  SELECT substr(order_date,1,7) AS month, SUM(total_amount) AS revenue
  FROM orders
  WHERE status = 'completed'
  GROUP BY month
)
SELECT month, revenue,
       SUM(revenue) OVER (ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM monthly
ORDER BY month;

-- 8. Customers with more than 1 completed order
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS customer_name, COUNT(o.order_id) AS orders_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.customer_id
HAVING orders_count > 1;

-- 9. Orders with mismatched totals
SELECT o.order_id, o.total_amount, SUM(oi.quantity * oi.unit_price) AS items_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING ABS(o.total_amount - SUM(oi.quantity * oi.unit_price)) > 0.01;
