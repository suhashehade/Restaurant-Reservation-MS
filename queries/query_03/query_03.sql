USE RestaurantReservationDB;
GO

SELECT 
o.OrderId,
    o.ReservationId,
    o.OrderDate,
    mi.Name AS MenuItemName,
    mi.Price,
    oi.Quantity,
    (oi.Quantity * mi.Price) AS SubTotal
FROM Orders o 
INNER JOIN OrderItems oi ON o.OrderId=oi.OrderId
INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
WHERE o.ReservationId=100;
GO

SELECT 
o.OrderId,
    o.ReservationId,
    o.OrderDate,
    mi.Name AS MenuItemName,
    mi.Price,
    oi.Quantity,
    (oi.Quantity * mi.Price) AS SubTotal
FROM Orders o 
INNER JOIN OrderItems oi ON o.OrderId=oi.OrderId
INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
WHERE o.ReservationId=103;
GO

SELECT 
o.OrderId,
    o.ReservationId,
    o.OrderDate,
    mi.Name AS MenuItemName,
    mi.Price,
    oi.Quantity,
    (oi.Quantity * mi.Price) AS SubTotal
FROM Orders o 
INNER JOIN OrderItems oi ON o.OrderId = oi.OrderId
INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
WHERE o.ReservationId = 405;
GO
