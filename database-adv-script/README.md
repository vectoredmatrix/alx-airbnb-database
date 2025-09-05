# README: SQL JOIN Workflow

This project explores how JOINs work in SQL using an Airbnb-style database.

## JOIN Workflow

1. **INNER JOIN**

   - Combines rows from two tables where there is a match in both.
   - Returns only the matching records.

2. **LEFT JOIN**

   - Returns all rows from the left table, and matching rows from the right.
   - Non-matching rows from the right appear as NULL.

3. **RIGHT JOIN**

   - Returns all rows from the right table, and matching rows from the left.
   - Non-matching rows from the left appear as NULL.

4. **FULL OUTER JOIN**
   - Returns all rows when there is a match in either table.
   - In MySQL/MariaDB, it can be simulated using `LEFT JOIN` + `RIGHT JOIN` with `UNION`.

## Notes

- JOINs help connect related data across tables.
- Aliases (like `u` for User, `b` for Booking) are optional but improve readability.

# SQL Subquery Workflow

This project demonstrates how **subqueries** work in SQL using an Airbnb-style database.

---

## Subquery Workflow

1. **Definition**

   - A subquery is a **query inside another query**.
   - It can return a single value, a list of values, or a table of rows.

2. **Usage Types**

   - **In WHERE clauses** → filter results based on values from another table.
   - **In SELECT statements** → calculate derived values for each row.
   - **In FROM clauses** → treat the subquery as a temporary table.

3. **Execution Flow**

   1. Inner query (subquery) is executed first.
   2. Results from the subquery are passed to the outer query.
   3. The outer query uses those results to filter, compare, or calculate final output.

4. **Notes**
   - Subqueries can be **scalar**, **multi-row**, or **multi-column**.
   - They allow dynamic filtering and complex queries without manually joining tables.
   - In some cases, subqueries can be replaced with JOINs for performance optimization.

# README: Indexing Workflow

## Overview

This workflow improves query performance in the **User**, **Booking**, and **Property** tables by creating indexes on high-usage columns.  
Indexes speed up queries by avoiding full table scans, making filtering, joins, and sorting operations more efficient.

---

## Workflow

### 1. Identify High-Usage Columns

Review SQL queries and find columns frequently used in:

- **WHERE clauses** (filters)
- **JOIN conditions** (relationships)
- **ORDER BY clauses** (sorting)

Example candidates:

- `User.id`
- `Booking.user_id`, `Booking.property_id`
- `Property.property_id`

---

### 2. Measure Baseline Performance

- Run queries with `EXPLAIN` or `ANALYZE` before indexing.
- Check if queries rely on **full table scans**.

---

### 3. Create Indexes

- Write `CREATE INDEX` commands for identified columns.
- Save them in **database_index.sql** for consistency.

---

### 4. Apply Indexes

- Execute the `database_index.sql` file in the database.
- Verify indexes are created successfully.

---

### 5. Measure Performance After Indexing

- Re-run queries with `EXPLAIN` or `ANALYZE`.
- Confirm the query planner is now using indexes.
- Compare execution times before and after.

---

## Outcome

- Queries execute faster.
- Reduced full table scans.
- Filtering, joining, and sorting operations are more efficient.

# Query Performance Optimization

This folder contains SQL scripts that demonstrate how to analyze and optimize query performance in the **ALX Airbnb Database**.

## Workflow

### 1. Initial Query

We start with a query that retrieves:

- Booking details
- User details
- Property details
- Payment details

The query joins the `Booking`, `User`, `Property`, and `Payment` tables.

### 2. Analyze with `EXPLAIN`

We run the query with `EXPLAIN` (or `EXPLAIN ANALYZE` in PostgreSQL) to understand how the database executes it.  
This shows:

- Which indexes (if any) are used
- Whether a **full table scan** is happening (`ALL`)
- If **temporary tables** or **filesort** are used

⚠️ Without indexes, large tables often result in:

- `ALL` (full scan)
- `Using temporary; Using filesort` → expensive operations

### 3. Identify Inefficiencies

From the `EXPLAIN` plan we look for:

- Missing index usage (`key = NULL`)
- Large number of scanned rows
- Extra operations like sorting or temp tables

### 4. Refactor Query

To improve performance, we:

- Remove unnecessary joins (e.g., payment details can be fetched separately if not always required).
- Only select needed columns instead of `SELECT *`.

### 5. Add Indexes

We create indexes on **high-usage columns**:

- `Booking(user_id)` → speeds up joining bookings to users
- `Booking(property_id)` → speeds up joining bookings to properties
- `Booking(status)` → helps filtering by booking status
- `Payment(booking_id)` → helps joining payments to bookings

### 6. Measure Again

Run `EXPLAIN` after adding indexes:

- Expect to see `ref` or `eq_ref` instead of `ALL`.
- Number of scanned rows drops significantly.
- Temporary tables/filesorts disappear.

✅ This shows the query is now optimized and will execute much faster on large datasets.

---

## Usage

1. Run the initial query in **`performance.sql`**.
2. Analyze performance:
   ```sql
   EXPLAIN SELECT ...;
   ```
