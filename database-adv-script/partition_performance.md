# Partitioning Workflow – Booking Table

## Objective

The goal of this task is to improve query performance on the large **Booking** table by using **partitioning**. Since queries often filter data by `start_date`, we partitioned the table on this column.

---

## Workflow

### 1. Identify Performance Issue

- The `Booking` table has become very large.
- Queries filtering by date (e.g., bookings in a specific year or month) were slow because the database scanned the **entire table**.

### 2. Choose Partitioning Strategy

- We selected **RANGE partitioning** on the `start_date` column.
- Each partition stores bookings for a specific year (e.g., `Booking_2022`, `Booking_2023`).
- A default partition is created to handle years outside the defined range.

### 3. Create Partitions

- The main `Booking` table was redefined as a **partitioned table**.
- Individual partitions were created for each year.
- This way, new rows are automatically routed to the correct partition based on `start_date`.

### 4. Test Query Performance

- Ran a query to fetch bookings in 2023:

  - **Before partitioning:** the query scanned the entire table.
  - **After partitioning:** only the relevant partition (`Booking_2023`) was scanned.

- Verified performance improvements with `EXPLAIN ANALYZE`.

### 5. Observed Improvements

- **Reduced I/O:** Queries only touch the relevant partition(s).
- **Faster Execution:** Time to filter bookings by year dropped significantly.
- **Better Maintenance:** Old partitions can be archived or dropped without affecting current data.

---

## Conclusion

Partitioning the `Booking` table by `start_date` improves performance for date-based queries, reduces the number of rows scanned, and makes the table more scalable for large datasets.
