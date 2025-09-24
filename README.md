## 🛒 Sales SQL Project 

This repository contains a **beginner-friendly end-to-end SQL project** built on a small e-commerce sales database.  
It includes schema design, sample data, seed scripts, and SQL queries for both practice and analysis.

---

## 📌 Project Objectives
- Learn how to design a relational database schema  
- Practice creating tables and inserting sample data  
- Explore SQL queries — filtering, joins, aggregates, CTEs, and window functions  
- Perform beginner → intermediate level data analysis
  
---

## 📂 Project Structure
sales-sql-project/
├─ README.md
├─ schema.sql # Database schema (tables + indexes)
├─ seed_data.sql # Insert statements with sample data
├─ queries.sql # Beginner practice queries
├─ analysis_queries.sql # Analysis queries (aggregates, CTEs, window functions)
├─ sample_data/ # Raw CSV files
│ ├─ customers.csv
│ ├─ products.csv
│ ├─ orders.csv
│ └─ order_items.csv
└─ .gitignore

---

## ⚙️ How to Run (Using SQLite)

1. Install **SQLite**  
Check with:  
```bash
sqlite3 --version
```
   
2. Create a database and run schema + seed scripts:
```bash
sqlite3 sales.db < schema.sql
sqlite3 sales.db < seed_data.sql
```

3..Open the database and run queries:
```bash
sqlite3 sales.db
.read queries.sql
.read analysis_queries.sql
```
---

## 🗂️ Database Schema

The project models a small e-commerce system with 4 main tables:

customers — basic customer details

products — product catalog with categories & prices

orders — customer orders with status and total amount

order_items — line items for each order

---

## 🔎 Example Queries & 📊 Sample Analysis

✅ Total revenue from completed orders
```sql
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'completed';
```
Output:

| total\_revenue |
| -------------- |
| 301.47         |


✅ Revenue contribution by customer
```sql
SELECT c.first_name || ' ' || c.last_name AS customer_name,
       SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.customer_id
ORDER BY revenue DESC;
```
Output:

| customer\_name | revenue |
| -------------- | ------- |
| Anita Sharma   | 151.48  |
| Asha Narayan   | 124.99  |
| Raj Patel      | 25.00   |


✅ Orders per city
```sql
SELECT p.name, SUM(oi.quantity) AS total_qty
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY p.product_id
ORDER BY total_qty DESC;
```
Output:

| name                        | total\_qty |
| --------------------------- | ---------- |
| USB-C Cable                 | 6          |
| Noise-cancelling Headphones | 1          |
| Wireless Mouse              | 1          |
| Portable Charger            | 2          |
| Mechanical Keyboard         | 1          |


✅ Average Order Value (AOV)
```sql

SELECT AVG(total_amount) AS avg_order_value
FROM orders
WHERE status = 'completed';
```
Output:

| avg\_order\_value |
| ----------------- |
| 75.37             |



✅ Monthly revenue trend using CTEs + window functions
```sql

WITH monthly AS (
  SELECT substr(order_date,1,7) AS month,
         SUM(total_amount) AS revenue
  FROM orders
  WHERE status = 'completed'
  GROUP BY month
)
SELECT month, revenue
FROM monthly
ORDER BY month;
```
Output:

| month   | revenue |
| ------- | ------- |
| 2024-06 | 301.47  |


---

## 📝 Summary
This project demonstrates how SQL can be used to design a database, manage data, and extract meaningful business insights.  
Through this project, I learned how to design a relational schema, write SQL queries from basics to advanced, and analyze real-world sales data.  
It helped me connect technical SQL skills with meaningful business insights like revenue trends, top customers, and best-selling products.  

---

📄 License

MIT License © Brindha P


