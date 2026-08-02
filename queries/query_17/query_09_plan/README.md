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

The 2 most interesting things in the plan are Sort (Cost 47%) that used in ```GROUP BY```, that means that ```Reservations.RestaurantId``` as a FK is not index, and also another Sort (Cost 30%) that used in ```MAX```.

It cost 47% because the ```GROUP BY``` sort the data by the FK ```Orders.ReservationId``` before group it, also ```MAX``` need to sort the data then get the max.

Here is the Sort ```MAX(ReservationsCount)``` high cost reason, the ```MAX``` => 30% then ```GROUP BY``` => 47%.




