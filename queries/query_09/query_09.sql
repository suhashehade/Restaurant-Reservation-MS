WITH Reservation_Count_CTE AS (
  SELECT COUNT(RestaurantId) AS ReservationsCount, RestaurantId  FROM Reservations  GROUP BY RestaurantId
)

SELECT r.RestaurantId, r.Name, rr.ReservationsCount AS HighRankRestaurant 
FROM Reservation_Count_CTE rr 
INNER JOIN Restaurants r ON rr.RestaurantId = r.RestaurantId
WHERE rr.ReservationsCount = (SELECT MAX(ReservationsCount) FROM Reservation_Count_CTE); 


