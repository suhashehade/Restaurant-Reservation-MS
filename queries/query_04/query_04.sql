USE RestaurantReservationDB;
GO

SELECT 
    o.ReservationId,
    mi.Name AS MenuItemName,
    mi.Price,
    mi.Description,
    (oi.Quantity * mi.Price) AS SubTotal
FROM Orders o 
INNER JOIN OrderItems oi ON o.OrderId=oi.OrderId
INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
WHERE o.ReservationId=403;
GO