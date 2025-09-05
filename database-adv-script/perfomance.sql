-- performance.sql
-- Initial query: Retrieve all bookings with user, property, and payment details
-- Note: No WHERE / AND clauses are used here (full dataset).

EXPLAIN SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN User u 
    ON b.user_id = u.id
JOIN Property p 
    ON b.property_id = p.property_id
LEFT JOIN Payment pay 
    ON b.booking_id = pay.booking_id;
