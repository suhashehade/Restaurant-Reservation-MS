## **List of Ordered Menu Items: Lists the menu items ordered by a specific reservation.** ##


### **SQL** ###

```sql
USE RestaurantReservationDB;
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
```

### **Rationale behind the query** ###

Apply ```INNER JOIN``` between ```Orders```, ```OrderItems```, and ```MenuItems``` tables, to show the orders with its orders items with associated menu items details.

Apply ```(oi.Quantity * mi.Price) AS SubTotal``` to show the subTotal of each order item from the menu item price.
