use `alx_airbnb_database`;

SELECT  *
FROM Property
WHERE Property.property_id IN ( SELECT Review.property_id FROM Review WHERE Review.rating > 4 ); use `alx_airbnb_database`;

SELECT  user_id
       ,COUNT(*) AS TOTAL_BOOKING
FROM Booking
GROUP BY  user_id
HAVING COUNT(*) > 3;