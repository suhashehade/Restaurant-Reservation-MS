## **List of Orders and Menu Items: Lists the orders placed on a specific given reservation along with the associated menu items.** ##


### **SQL** ###

```sql
USE RestaurantReservationDB;
GO

SELECT *
FROM Orders o INNER JOIN OrderItems oi 
ON o.OrderId=oi.OrderId
WHERE o.ReservationId=100;
GO

SELECT *
FROM Orders o INNER JOIN OrderItems oi 
ON o.OrderId=oi.OrderId
WHERE o.ReservationId=101;
GO

SELECT *
FROM Orders o 
INNER JOIN OrderItems oi ON o.OrderId = oi.OrderId
WHERE o.ReservationId = 405;
GO
```

### **Rationale behind the query** ###
Some of reservations haven't orders (ReservationId: 1 - 100) and some of them have one order (ReservationId: 101 - 400) or many orders (ReservationId: 401 - 500), so the first ```SELECT``` have zero rows because no orders, the second ```SELECT``` have 3 rows because it have one order with 3 order items, and the last ```SELECT``` have 6 rows represent 2 orders, each order have 3 order items.

