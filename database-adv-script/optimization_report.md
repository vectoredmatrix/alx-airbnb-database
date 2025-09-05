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
