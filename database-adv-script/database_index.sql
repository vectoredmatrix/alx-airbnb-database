-- Indexes for User TABLE

CREATE INDEX idx_user_role
ON User(role);
-- Indexes for Booking table

CREATE INDEX idx_booking_user_id
ON Booking(user_id);

CREATE INDEX idx_booking_property_id
ON Booking(property_id);

CREATE INDEX idx_booking_status
ON Booking(status);

CREATE INDEX idx_booking_start_date
ON Booking(start_date);
-- Indexes for Property table

CREATE INDEX idx_property_location
ON Property(location);

CREATE INDEX idx_property_price
ON Property(pricepernight);
-- Indexes for Review table

CREATE INDEX idx_review_property_id
ON Review(property_id);

CREATE INDEX idx_review_rating
ON Review(rating); EXPLAIN

EXPLAIN ANALYZE SELECT * FROM Booking b
JOIN User u ON b.user_id = u.id
WHERE b.status = 'confirmed';
