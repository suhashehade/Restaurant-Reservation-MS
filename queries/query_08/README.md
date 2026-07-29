## **Reservation’s Order with CTEs: Identify reservations which have 2 or more orders using CTEs.** ##

### **SQL Query** ###

```sql
WITH Reservation_Order_CTE AS (
  SELECT COUNT(ReservationId) AS OrdersCount, ReservationId  FROM Orders GROUP BY ReservationId HAVING COUNT(ReservationId) >= 2
)

SELECT r.ReservationId, r.ReservationDate, r.PartySize, r.RestaurantId
FROM Reservation_Order_CTE o 
INNER JOIN Reservations r ON o.ReservationId=r.ReservationId; 
```

### **Rationale behind the query** ###

Use the CTE ```Reservation_Order_CTE``` to hold the subquery ```SELECT COUNT(ReservationId) AS OrdersCount, ReservationId  FROM Orders GROUP BY ReservationId HAVING COUNT(ReservationId) >= 2``` to make the query simplified and readable.

The CTE count the orders for each reservation and return just the reservations that have 2 orders or more.

To verify the result the reservations that have ID range (401 - 500) have more than one order (seeded).
