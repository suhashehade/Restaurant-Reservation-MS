## **Retrieve Reservations Report with Views: Use a view to list all reservations information including restaurants and customers information.** ##

### **SQL View** ###

```sql
USE RestaurantReservationDB;
GO

ALTER VIEW Reservation_Report AS 
SELECT 
    reser.ReservationId,
    reser.ReservationDate,
    rest.RestaurantId,
    rest.Name AS RestaurantName,
    c.CustomerId,
    c.FirstName AS CustomerName
FROM Reservations reser 
INNER JOIN Restaurants rest ON reser.RestaurantId = rest.RestaurantId
INNER JOIN Customers c ON reser.CustomerId = c.CustomerId;
```

### **SQL Query** ###

```sql
USE RestaurantReservationDB;
GO

SELECT * FROM Reservation_Report;
GO
```

### **Rationale behind the query** ###

Use View to retrieve the list of reservations.

Use ```CREATE VIEW``` for the first time of view creation and use ```ALTER VIEW``` to run the file again.

Run the ```SELECT``` on the virtual table ```Reservation_Report```.
