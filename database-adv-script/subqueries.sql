use `alx_airbnb_database`;

SELECT * FROM Property 

WHERE property_id IN (
	SELECT property_id
	FROM Review
	GROUP BY property_id
    HAVING AVG(rating)> 4.0
     );


SELECT  user_id
       ,COUNT(*) AS TOTAL_BOOKING
FROM Booking
GROUP BY  user_id
HAVING COUNT(*) > 3;