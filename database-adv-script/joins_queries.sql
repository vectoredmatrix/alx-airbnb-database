use `alx_airbnb_database`;

SELECT * from Booking INNER join User on Booking.user_id = User.id  LIMIT 3;

SELECT * from Property LEFT JOIN Review on Property.property_id = Review.property_id LIMIT 10 ;



select * from User  RIGHT JOIN Booking on User.id = Booking.user_id 
UNION
select * from User  LEFT JOIN Booking on User.id = Booking.user_id  LIMIT 10;