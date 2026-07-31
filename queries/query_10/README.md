## **Popular Menu Item Analysis using Joins and Window Functions** ##

### **Description** ###

Identify the most popular menu item for each restaurant for a given month.

### **SQL Query** ###

```sql
USE RestaurantReservationDB; 
GO

WITH RankedItems_CTE AS (
    SELECT 
        r.RestaurantId,
        mi.Name AS ItemName,
        SUM(oi.Quantity) AS TotalOrdered, 
        DENSE_RANK() OVER(
            PARTITION BY r.RestaurantId 
            ORDER BY SUM(oi.Quantity) DESC
        ) AS ItemRank
    FROM OrderItems oi
    INNER JOIN Orders o ON oi.OrderId=o.OrderId
    INNER JOIN Reservations res ON o.ReservationId = res.ReservationId
    INNER JOIN MenuItems mi ON oi.ItemId = mi.ItemId
    INNER JOIN Restaurants r ON res.RestaurantId = r.RestaurantId
      WHERE 
       DAY(res.ReservationDate) = 5
      AND MONTH(res.ReservationDate) = 8
      AND YEAR(res.ReservationDate) = 2026
    GROUP BY r.RestaurantId, mi.ItemId, mi.Name
)
SELECT RestaurantId, ItemName, TotalOrdered
FROM RankedItems_CTE
WHERE ItemRank = 1;  
```

### **Rationale behind the query** ###

#### Use the CTE ```RankedItems_CTE``` make this:

Use ```INNER JOIN``` to get the infromation from these tables: ```OrderItems```, ```Orders```, ```Reservations```, ```MenuItems```, and ```Restaurants```.

Use ```GROUP BY``` to make a group of data by its restaurant, menu item id, and menu item name, that means it is calcaulate a number of orders for each menu item for each restaurant in specific date '2026/08/05'.

Use ```RANK()``` Window function to get the ranks of the menu items for each restaurant ```PARTITION BY```, and ```ORDER BY DESC``` to get the higher number first, that mean if there is more than one item have the same popularity it returns all of them.

Then the query select the first rank from the CTE.


