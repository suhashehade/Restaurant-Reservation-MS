## **Restaurant Popularity using Aggregation** ##

### **Description** ###

Rank restaurants by the reservation frequency.

### **SQL Query** ###

```sql
USE RestaurantReservationDB; 
GO

WITH Reservation_Count_CTE AS (
  SELECT COUNT(RestaurantId) AS ReservationsCount, RestaurantId  FROM Reservations  GROUP BY RestaurantId
)

SELECT r.RestaurantId, r.Name, rr.ReservationsCount AS HighRankRestaurant 
FROM Reservation_Count_CTE rr 
INNER JOIN Restaurants r ON rr.RestaurantId = r.RestaurantId
WHERE rr.ReservationsCount = (SELECT MAX(ReservationsCount) FROM Reservation_Count_CTE);
```

### **Rationale behind the query** ###

Use the CTE ```Reservation_Count_CTE``` to hold the subquery ```SELECT COUNT(RestaurantId) AS ReservationsCount, RestaurantId  FROM Reservations  GROUP BY RestaurantId``` to make the query simplified and readable.

The CTE count the reservations for each restaurants.

The restaurant that have the high rank calculated using ```MAX```.
