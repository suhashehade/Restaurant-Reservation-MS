## **List of Reservations: Retrieve all reservations for a specific customers.** ##


### **SQL** ###

```sql
USE RestaurantReservationDB;
GO

SELECT * FROM Reservations r INNER JOIN Customers c
ON r.CustomerId = c.CustomerId 
WHERE c.CustomerId BETWEEN 1 AND 10;
GO
```

### **Rationale behind the query** ###
I need all reservations for a specific customers, so I have to retrive a specific records or a range, I used ```BETWEEN```, also I can use ```IN```.

