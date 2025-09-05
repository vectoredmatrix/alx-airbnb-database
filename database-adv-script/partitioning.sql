-- partitioning.sql
-- Purpose: Improve performance of queries on a large Booking table
-- by partitioning based on the start_date column.

-- ==============================================================
-- 1) Drop old table if needed (for demo purposes only)
-- ==============================================================

-- DROP TABLE IF EXISTS Booking;

-- ==============================================================
-- 2) Recreate Booking table with RANGE partitioning by year
-- ==============================================================

CREATE TABLE Booking (
    booking_id     INT PRIMARY KEY,
    user_id        INT NOT NULL,
    property_id    INT NOT NULL,
    start_date     DATE NOT NULL,
    end_date       DATE NOT NULL,
    total_price    DECIMAL(10,2),
    status         VARCHAR(50)
)
PARTITION BY RANGE (YEAR(start_date));

-- Create partitions by year
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM (2022) TO (2023);

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM (2023) TO (2024);

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM (2024) TO (2025);

-- Default partition for other years
CREATE TABLE Booking_default PARTITION OF Booking
    DEFAULT;

-- ==============================================================
-- 3) Sample query: Fetch bookings by date range
-- ==============================================================

EXPLAIN ANALYZE
SELECT booking_id, user_id, property_id, start_date, end_date, total_price, status
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- ==============================================================
-- 4) Observations (expected improvements)
-- ==============================================================

-- - Before partitioning: Query scanned the entire Booking table (all rows).
-- - After partitioning: Query only scans the relevant partition(s), e.g., Booking_2023.
-- - This reduces I/O and improves performance for queries filtered by start_date.
-- - Insertions are automatically routed to the right partition.
-- ==============================================================

