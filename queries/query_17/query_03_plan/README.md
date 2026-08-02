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

The most interesting in the plan is Hash Match Algrorithm (Cost 53%) that used in ```INNER JOIN```, that means that some of the keys (FKs) are not indexes.

It cost 53% because the tables have ~thousands of rows and there is no indexes on FKs, so it create a hash table from the smaller table (ex: orderItems) then scan the second table to get the hash and match it with hash table value. 



