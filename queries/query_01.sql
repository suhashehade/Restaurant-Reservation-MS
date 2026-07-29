USE RestaurantReservationDB;
GO

SELECT * FROM Reservations r INNER JOIN Customers c
ON r.CustomerId = c.CustomerId 
WHERE c.CustomerId BETWEEN 1 AND 10;
GO