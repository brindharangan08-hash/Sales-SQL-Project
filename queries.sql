-- 1. Simple select
SELECT * FROM customers LIMIT 5;

-- 2. Filter
SELECT order_id, customer_id, total_amount FROM orders WHERE status = 'completed';

-- 3. Join orders with customers
SELECT o.order_id, o.order_date, c.first_name || ' ' || c.last_name AS customer_name, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;

-- 4. Join order_items with products
SELECT oi.order_item_id, oi.order_id, p.name, oi.quantity, oi.unit_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 5. Calculate order totals from order_items
SELECT oi.order_id, SUM(oi.quantity * oi.unit_price) AS calc_total
FROM order_items oi
GROUP BY oi.order_id;
