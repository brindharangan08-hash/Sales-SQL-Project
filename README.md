🛒 Sales SQL Project 

This repository contains a **beginner-friendly end-to-end SQL project** built on a small e-commerce sales database.  
It includes schema design, sample data, seed scripts, and SQL queries for both practice and analysis.



## 📌 Project Objectives
- Learn how to design a relational database schema  
- Practice creating tables and inserting sample data  
- Explore SQL queries — filtering, joins, aggregates, CTEs, and window functions  
- Perform beginner → intermediate level data analysis  



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


## ⚙️ How to Run (Using SQLite)
1. Install **SQLite** (already available on most systems).  
   Check with:  
   ```bash
   sqlite3 --version
   
Create a database and run schema + seed scripts:
```bash
sqlite3 sales.db < schema.sql
sqlite3 sales.db < seed_data.sql
Open the database and run queries:

sqlite3 sales.db
.read queries.sql
.read analysis_queries.sql
```

🗂️ Database Schema
The project models a small e-commerce system with 4 main tables:

customers — basic customer details

products — product catalog with categories & prices

orders — customer orders with status and total amount

order_items — line items for each order

🔎 Example Queries
Select all customers and their first 5 rows

Join customers and orders to get sales history

Find top-selling products

Calculate monthly revenue and running totals

Find customers with multiple completed orders

📊 Sample Analysis
✅ Total revenue from completed orders

✅ Revenue contribution by customer

✅ Orders per city

✅ Average Order Value (AOV)

✅ Monthly revenue trend using CTEs + window functions

