## **List of Ordered Menu Items** ##

### **Description** ###

Lists the menu items ordered by a specific reservation.

### **SQL Query** ###

```sql
USE RestaurantReservationDB;
GO

SET SHOWPLAN_XML ON;
GO

SELECT 
    o.ReservationId,
    mi.Name AS MenuItemName,
    mi.Price,
    mi.Description,
    (oi.Quantity * mi.Price) AS SubTotal
FROM Orders o 
INNER JOIN OrderItems oi ON o.OrderId=oi.OrderId
INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
WHERE o.ReservationId=403;
GO

SET SHOWPLAN_ALL OFF;
GO
```

### **Rationale behind the query** ###

Making the FKs: ```OrderItems.OrderId``` and ```OrderItems.ItemId``` as indexes change the Hash Match Algorithm (Cost 46%) to Nested loops (Cost 0%).



