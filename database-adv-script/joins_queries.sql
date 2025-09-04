-- use `alx_airbnb_database`;

SELECT * FROM Booking INNER JOIN User on Booking.user_id = User.id  LIMIT 3;

SELECT * FROM Property LEFT JOIN Review on Property.property_id = Review.property_id  ORDER BY Review.rating DESC  ;



SELECT *
FROM User 
FULL OUTER JOIN Booking
    ON u.id = b.user_id
LIMIT 10;
