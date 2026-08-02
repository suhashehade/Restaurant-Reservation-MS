## **Reservation’s Order with CTEs** ##

### **Description** ###

Identify reservations which have 2 or more orders using CTEs.

### **SQL Query** ###

```sql
USE RestaurantReservationDB; 
GO

SET SHOWPLAN_XML ON;
GO

WITH Reservation_Order_CTE AS (
  SELECT COUNT(ReservationId) AS OrdersCount, ReservationId  FROM Orders GROUP BY ReservationId HAVING COUNT(ReservationId) >= 2
)

SELECT r.ReservationId, r.ReservationDate, r.PartySize, r.RestaurantId
FROM Reservation_Order_CTE o 
INNER JOIN Reservations r ON o.ReservationId=r.ReservationId; 
GO

SET SHOWPLAN_ALL OFF;
GO
```

### **Rationale behind the query** ###

The most interesting in the plan is Sort (Cost 49%) that used in ```GROUP BY```, that means that ```Orders.ReservationId``` as a FK is not index.

It cost 53% because the ```GROUP BY``` sort the data by the FK ```Orders.ReservationId``` before group it.



