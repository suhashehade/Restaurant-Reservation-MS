## **Reservation’s Order with CTEs** ##

### **Description** ###

Identify reservations which have 2 or more orders using CTEs.

### **SQL Query** ###

```sql
USE RestaurantReservationDB; 
GO

SET SHOWPLAN_XML ON;
GO

WITH Reservation_Count_CTE AS (
  SELECT COUNT(RestaurantId) AS ReservationsCount, RestaurantId  FROM Reservations  GROUP BY RestaurantId
)

SELECT r.RestaurantId, r.Name, rr.ReservationsCount AS HighRankRestaurant 
FROM Reservation_Count_CTE rr 
INNER JOIN Restaurants r ON rr.RestaurantId = r.RestaurantId
WHERE rr.ReservationsCount = (SELECT MAX(ReservationsCount) FROM Reservation_Count_CTE);
GO

SET SHOWPLAN_ALL OFF;
GO
```

### **Rationale behind the query** ###

Making the FK: ```Reservations.RestaurantId``` as indexes change both Sort (Cost 30%, 47%) to remove the Sort.




