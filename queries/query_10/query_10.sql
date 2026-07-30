USE RestaurantReservationDB; 
GO

WITH RankedItems_CTE AS (
    SELECT 
        r.RestaurantId,
        mi.Name AS ItemName,
        SUM(oi.Quantity) AS TotalOrdered, 
        DENSE_RANK() OVER(
            PARTITION BY r.RestaurantId 
            ORDER BY SUM(oi.Quantity) DESC
        ) AS ItemRank
    FROM OrderItems oi
    INNER JOIN Orders o ON oi.OrderId=o.OrderId
    INNER JOIN Reservations res ON o.ReservationId = res.ReservationId
    INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
    INNER JOIN Restaurants r ON res.RestaurantId = r.RestaurantId
      WHERE 
       DAY(res.ReservationDate) = 5
      AND MONTH(res.ReservationDate) = 8
      AND YEAR(res.ReservationDate) = 2026
    GROUP BY r.RestaurantId, mi.ItemId, mi.Name
)
SELECT RestaurantId, ItemName, TotalOrdered
FROM RankedItems_CTE
WHERE ItemRank = 1; 
