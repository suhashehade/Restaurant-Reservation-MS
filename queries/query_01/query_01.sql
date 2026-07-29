USE RestaurantReservationDB;
GO

SELECT * FROM Reservations r INNER JOIN Customers c
ON r.CustomerId = c.CustomerId 
WHERE c.CustomerId IN (1, 5, 20, 43);
GO