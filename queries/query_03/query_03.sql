USE RestaurantReservationDB;
GO

SELECT *
FROM Orders o INNER JOIN OrderItems oi 
ON o.OrderId=oi.OrderId
WHERE o.ReservationId=100;
GO

SELECT *
FROM Orders o INNER JOIN OrderItems oi 
ON o.OrderId=oi.OrderId
WHERE o.ReservationId=103;
GO

SELECT *
FROM Orders o 
INNER JOIN OrderItems oi ON o.OrderId = oi.OrderId
WHERE o.ReservationId = 405;
GO
