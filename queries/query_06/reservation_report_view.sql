USE RestaurantReservationDB;
GO

ALTER VIEW Reservation_Report AS 
SELECT 
    reser.ReservationId,
    reser.ReservationDate,
    rest.RestaurantId,
    rest.Name AS RestaurantName,
    c.CustomerId,
    c.FirstName AS CustomerName
FROM Reservations reser 
INNER JOIN Restaurants rest ON reser.RestaurantId = rest.RestaurantId
INNER JOIN Customers c ON reser.CustomerId = c.CustomerId;



