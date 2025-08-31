USE `alx_airbnb_database`;

-- -------------------------
-- Insert Users
-- -------------------------
INSERT INTO `User` (`id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`)
VALUES
(UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '1234567890', 'guest'),
(UUID(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '0987654321', 'host'),
(UUID(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', '5555555555', 'admin');

-- -------------------------
-- Capture the UUIDs for reference
-- -------------------------
SET @user_john = (SELECT id FROM `User` WHERE email='john.doe@example.com');
SET @user_jane = (SELECT id FROM `User` WHERE email='jane.smith@example.com');
SET @user_alice = (SELECT id FROM `User` WHERE email='alice.johnson@example.com');

-- -------------------------
-- Insert Properties
-- -------------------------
INSERT INTO `Property` (`property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`)
VALUES
(UUID(), @user_jane, 'Cozy Cottage', 'A cozy cottage in the woods.', 'Forest', 100.00),
(UUID(), @user_jane, 'Beachfront Villa', 'A luxurious villa by the beach.', 'Beach', 300.00),
(UUID(), @user_jane, 'City Apartment', 'A modern apartment in the city center.', 'City', 150.00);

-- -------------------------
-- Capture Property UUIDs
-- -------------------------
SET @property1 = (SELECT property_id FROM `Property` WHERE name='Cozy Cottage');
SET @property2 = (SELECT property_id FROM `Property` WHERE name='Beachfront Villa');
SET @property3 = (SELECT property_id FROM `Property` WHERE name='City Apartment');

-- -------------------------
-- Insert Bookings
-- -------------------------
INSERT INTO `Booking` (`booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`)
VALUES
(UUID(), @property1, @user_john, '2023-01-01', '2023-01-07', 700.00, 'confirmed'),
(UUID(), @property2, @user_john, '2023-02-15', '2023-02-20', 1500.00, 'pending'),
(UUID(), @property3, @user_alice, '2023-03-10', '2023-03-12', 300.00, 'canceled');

-- -------------------------
-- Capture Booking UUIDs
-- -------------------------
SET @booking1 = (SELECT booking_id FROM `Booking` WHERE property_id=@property1 AND user_id=@user_john);
SET @booking2 = (SELECT booking_id FROM `Booking` WHERE property_id=@property2 AND user_id=@user_john);
SET @booking3 = (SELECT booking_id FROM `Booking` WHERE property_id=@property3 AND user_id=@user_alice);

-- -------------------------
-- Insert Reviews
-- -------------------------
INSERT INTO `Review` (`review_id`, `property_id`, `user_id`, `rating`, `Comment`)
VALUES
(UUID(), @property1, @user_john, 5, 'Amazing stay!'),
(UUID(), @property2, @user_john, 4, 'Very nice place, but a bit noisy.'),
(UUID(), @property3, @user_alice, 3, 'It was okay, nothing special.');

-- -------------------------
-- Insert Payments
-- -------------------------
INSERT INTO `Payment` (`payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`)
VALUES
(UUID(), @booking1, 700.00, '2023-01-01', 'credit_card'),
(UUID(), @booking2, 1500.00, '2023-02-15', 'paypal'),
(UUID(), @booking3, 300.00, '2023-03-10', 'stripe');

-- -------------------------
-- Insert Messages
-- -------------------------
INSERT INTO `Message` (`message_id`, `sender_id`, `recipient_id`, `message_body`)
VALUES
(UUID(), @user_john, @user_jane, 'Hello! I have a question about your property.'),
(UUID(), @user_jane, @user_john, 'Sure! What would you like to know?'),
(UUID(), @user_alice, @user_john, 'Thanks for your review! Let me know if you need anything.');
