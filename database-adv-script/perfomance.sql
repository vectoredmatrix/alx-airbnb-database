-- ============================
-- performance.sql
-- ============================

-- 1. Initial Query (fetch bookings with user, property, and payment details)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- =======================================
-- 2. Analyze Query Performance
-- =======================================
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- =======================================
-- 3. Sample EXPLAIN Output (before indexing)
-- =======================================
-- id | select_type | table | type | possible_keys     | key   | rows   | Extra
-- ----------------------------------------------------------------------------------------
--  1 | SIMPLE      | b     | ALL  | NULL              | NULL  | 100000 | Using temporary; Using filesort
--  1 | SIMPLE      | u     | ALL  | PRIMARY           | NULL  |  20000 | Using where
--  1 | SIMPLE      | p     | ALL  | PRIMARY           | NULL  |   5000 | Using where
--  1 | SIMPLE      | pay   | ALL  | fk_payment_booking| NULL  |  50000 | NULL

-- ⚠️ Issues:
-- - "ALL" means full table scan (slow on large tables).
-- - No indexes used (key = NULL).
-- - "Using temporary; Using filesort" → expensive sorting.

-- =======================================
-- 4. Refactored Query (simplify joins)
-- =======================================
-- If payment details are not always needed, fetch them separately.
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.property_id;

-- =======================================
-- 5. Index Recommendations
-- =======================================
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- =======================================
-- 6. Sample EXPLAIN Output (after indexing)
-- =======================================
-- id | select_type | table | type | possible_keys                 | key                   | rows | Extra
-- ---------------------------------------------------------------------------------------------------------
--  1 | SIMPLE      | b     | ref  | idx_booking_user_id,idx_booking_property_id | idx_booking_user_id |  300 | Using index
--  1 | SIMPLE      | u     | eq_ref | PRIMARY                    | PRIMARY               |    1 | NULL
--  1 | SIMPLE      | p     | eq_ref | PRIMARY                    | PRIMARY               |    1 | NULL
--  1 | SIMPLE      | pay   | ref    | idx_payment_booking_id      | idx_payment_booking_id|    2 | NULL

-- ✅ Improvements:
-- - Indexes are being used (key no longer NULL).
-- - Rows scanned reduced dramatically.
-- - No temporary tables/filesorts.
-- - Execution time will be much faster.
