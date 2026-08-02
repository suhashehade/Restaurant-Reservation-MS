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

Making the FK: ```Orders.ReservationId``` as indexes change the Sort (Cost 49%) to remove the Sort but it increase the cost of the Merge Join (Cost 42%).



