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

The most interesting in the plan is Hash Match Algrorithm (Cost 46%) that used in ```INNER JOIN```, that means that some of the keys (FKs) are not indexes.

It cost 46% because the tables have ~thousands of rows and there is no indexes on FKs, so it create a hash table from the smaller table (ex: orderItems) then scan the second table to get the hash and match it with hash table value. 



