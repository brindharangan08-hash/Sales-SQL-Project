# Sales SQL Project (Beginner)

A simple, end-to-end SQL project built for beginners. It models a small e-commerce sales database and includes schema, sample data, and queries you'd typically run to analyze sales.

## Goal
- Learn how to design a small relational schema
- Create tables and load CSV data
- Write common queries: joins, aggregates, window functions, CTEs

## Requirements
- SQLite (or any SQL engine). Instructions use SQLite for simplicity.

## How to run (SQLite)
1. Install SQLite (if not already installed). On many systems, `sqlite3` is available.
2. Create a new database and run the schema and seed scripts:

```bash
sqlite3 sales.db < schema.sql
sqlite3 sales.db < seed_data.sql
```

3. Explore queries:

```bash
sqlite3 sales.db
.read queries.sql
.read analysis_queries.sql
```

## Files
- schema.sql — CREATE TABLE statements and indexes
- seed_data.sql — SQL INSERT statements
- sample_data/*.csv — small CSV files
- queries.sql — practice queries (selects, joins)
- analysis_queries.sql — more advanced queries (grouping, CTEs, window functions)

## Notes
- The provided data is synthetic and small — extend it to practice more.
- Works on SQLite. Minor changes may be needed for MySQL/Postgres.
