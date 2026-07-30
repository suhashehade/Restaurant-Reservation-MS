USE RestaurantReservationDB; 
GO

WITH Reservation_Order_CTE AS (
  SELECT COUNT(ReservationId) AS OrdersCount, ReservationId  FROM Orders GROUP BY ReservationId HAVING COUNT(ReservationId) >= 2
)

SELECT r.ReservationId, r.ReservationDate, r.PartySize, r.RestaurantId
FROM Reservation_Order_CTE o 
INNER JOIN Reservations r ON o.ReservationId=r.ReservationId; 

