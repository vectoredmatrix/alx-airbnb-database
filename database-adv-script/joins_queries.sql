--use `alx_airbnb_database`;

SELECT * FROM Booking INNER JOIN User on Booking.user_id = User.id  LIMIT 3;

SELECT * FROM Property LEFT JOIN Review on Property.property_id = Review.property_id LIMIT 10 ;



select * FROM User  RIGHT JOIN Booking on User.id = Booking.user_id 
UNION
select * FROM User  LEFT JOIN Booking on User.id = Booking.user_id  LIMIT 10;