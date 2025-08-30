# Normalization -> Third Normal Form (3NF)

## 1. Review Table

Reviewing should be restricted to only users that have booked a room or apartment. Therefore, the `booking_id` will cover for both `property_id` and `user_id` in the `review` table, because it already exists in the `booking` table as a foreign key.

## 2. Property Table

Location should be a table on its own, because two properties can have the same address. This also aids consistency across properties when choosing locations.

## 3. Review Table

`rating` and `review` in the `review` table should have separate tables and should be referenced with a foreign key.
