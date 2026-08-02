## **List of Orders and Menu Items** ##

### **Description** ###

Lists the orders placed on a specific given reservation along with the associated menu items.

### **SQL Query** ###

```sql
USE RestaurantReservationDB;
GO

SET SHOWPLAN_XML ON;
GO

SELECT 
o.OrderId,
    o.ReservationId,
    o.OrderDate,
    mi.Name AS MenuItemName,
    mi.Price,
    oi.Quantity,
    (oi.Quantity * mi.Price) AS SubTotal
FROM Orders o 
INNER JOIN OrderItems oi ON o.OrderId=oi.OrderId
INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
WHERE o.ReservationId=100;
GO

SET SHOWPLAN_ALL OFF;
GO
```

### **Rationale behind the query** ###

Making the FKs: ```OrderItems.OrderId``` and ```OrderItems.ItemId``` as indexes change the Hash Match Algorithm (Cost 53%) to Nested loops (Cost 0%).



