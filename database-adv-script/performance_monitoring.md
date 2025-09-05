# Performance Monitoring Workflow

## Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## Workflow

### 1. Monitoring Query Performance

- Regularly ran performance checks on **frequently used queries**.
- Tools used:
  - `EXPLAIN` and `EXPLAIN ANALYZE` → to view execution plans.
  - `SHOW PROFILE` → to understand time spent in different query phases.
- Focused on queries involving:
  - `Booking` joins with `User` and `Property`.
  - Filtering by `status`, `start_date`, and `location`.

### 2. Identifying Bottlenecks

- Observed **full table scans** on large tables (`Booking` and `Payment`).
- Detected expensive operations like:
  - `Using temporary; Using filesort` → indicating inefficient sorting.
  - Missing indexes on filtering columns.
- High row counts in execution plans showed that queries were scanning far more data than necessary.

### 3. Implementing Schema Adjustments

- Added **indexes** on frequently filtered columns:
  - `Booking(user_id, status, start_date)`
  - `Property(location)`
  - `Payment(booking_id)`
- Considered **partitioning** large tables (e.g., `Booking` by `start_date`).
- Reduced selected columns in queries (avoiding
