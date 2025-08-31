-- Enable sandbox mode
/*M!999999\- enable the sandbox mode */ 

DROP DATABASE IF EXISTS `alx_airbnb_database`;
CREATE DATABASE `alx_airbnb_database`;
USE `alx_airbnb_database`;


DROP TABLE IF EXISTS `Booking`;
DROP TABLE IF EXISTS `Payment`;
DROP TABLE IF EXISTS `Review`;
DROP TABLE IF EXISTS `Property`;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `Message`;




-- -------------------------
-- Table structure for User
-- -------------------------
CREATE TABLE `User` (
  `id` CHAR(36) NOT NULL DEFAULT (UUID()),
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(25) DEFAULT NULL,
  `role` ENUM('guest','host','admin') NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------
-- Table structure for Property
-- -------------------------
CREATE TABLE `Property` (
  `property_id` CHAR(36) NOT NULL DEFAULT (UUID()),
  `host_id` CHAR(36) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NOT NULL,
  `location` VARCHAR(50) NOT NULL,
  `pricepernight` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_id`),
  KEY `fk_user` (`host_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`host_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------
-- Table structure for Booking
-- -------------------------
CREATE TABLE `Booking` (
  `booking_id` CHAR(36) NOT NULL DEFAULT (UUID()),
  `property_id` CHAR(36),
  `user_id` CHAR(36),
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `total_price` DECIMAL(10,2) NOT NULL,
  `status` ENUM('pending','confirmed','canceled') NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  KEY `fk_Booking_user` (`user_id`),
  KEY `fk_Booking_Property` (`property_id`),
  CONSTRAINT `fk_Booking_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  CONSTRAINT `fk_Booking_Property` FOREIGN KEY (`property_id`) REFERENCES `Property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------
-- Table structure for Review
-- -------------------------
CREATE TABLE `Review` (
  `review_id` CHAR(36) NOT NULL DEFAULT (UUID()),
  `property_id` CHAR(36),
  `user_id` CHAR(36),
  `rating` TINYINT NOT NULL CHECK (`rating` BETWEEN 1 AND 5),
  `Comment` TEXT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `fk_review_property` (`property_id`),
  KEY `fk_review_user` (`user_id`),
  CONSTRAINT `fk_review_property` FOREIGN KEY (`property_id`) REFERENCES `Property` (`property_id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------
-- Table structure for Payment
-- -------------------------
CREATE TABLE `Payment` (
  `payment_id` CHAR(36) NOT NULL DEFAULT (UUID()),
  `booking_id` CHAR(36),
  `amount` DECIMAL(10,2) NOT NULL,
  `payment_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` ENUM('credit_card','paypal','stripe') DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_booking` (`booking_id`),
  CONSTRAINT `fk_payment_booking` FOREIGN KEY (`booking_id`) REFERENCES `Booking` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------------------
-- Table structure for Message
-- -------------------------
CREATE TABLE `Message` (
  `message_id` CHAR(36) NOT NULL DEFAULT (UUID()),
  `sender_id` CHAR(36) NOT NULL,
  `recipient_id` CHAR(36) NOT NULL,
  `message_body` TEXT NOT NULL,
  `sent_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `fk_message_sender` (`sender_id`),
  KEY `fk_message_recipient` (`recipient_id`),
  CONSTRAINT `fk_message_sender` FOREIGN KEY (`sender_id`) REFERENCES `User` (`id`),
  CONSTRAINT `fk_message_recipient` FOREIGN KEY (`recipient_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
