## **List of Orders and Menu Items: Lists the orders placed on a specific given reservation along with the associated menu items.** ##


### **SQL** ###

```sql
USE RestaurantReservationDB;
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
WHERE o.ReservationId=103;
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
INNER JOIN OrderItems oi ON o.OrderId = oi.OrderId
INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
WHERE o.ReservationId = 405;
GO

```

### **Rationale behind the query** ###

Apply ```INNER JOIN``` between ```Orders```, ```OrderItems```, and ```MenuItems``` tables, to show the orders with its orders items with associated menu items details.

Apply ``` (oi.Quantity * mi.Price) AS SubTotal``` to show the subTotal of each order item from the menu item price.

Result:
Some of reservations haven't orders (ReservationId: 1 - 100) and some of them have one order (ReservationId: 101 - 400) or many orders (ReservationId: 401 - 500), so the first ```SELECT``` have zero rows because no orders, the second ```SELECT``` have 3 rows because it have one order with 3 order items, and the last ```SELECT``` have 6 rows represent 2 orders, each order have 3 order items, and the orders items associated menu items.

