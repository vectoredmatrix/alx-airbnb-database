## Airbnb database schema

This is a MariaDB database schema for an Airbnb-like booking platform. 
It stores information about users, properties, bookings, reviews, payments, and messages.

1. Install MariaDB / MySQL
2. Open terminal and log in: 
   ```bash
   sudo mariadb -u root -p




### Tables
1. **User** – Stores users (guests, hosts, admins)  
2. **Property** – Stores properties listed by hosts  
3. **Booking** – Tracks bookings of properties by users  
4. **Review** – Stores property reviews with ratings and comments  
5. **Payment** – Tracks payments for bookings  
6. **Message** – Stores messages between users  

### Relationships
- `Property.host_id` → `User.id`  
- `Booking.user_id` → `User.id`  
- `Booking.property_id` → `Property.property_id`  
- `Review.user_id` → `User.id`  
- `Review.property_id` → `Property.property_id`  
- `Payment.booking_id` → `Booking.booking_id`  
- `Message.sender_id` & `Message.recipient_id` → `User.id`

