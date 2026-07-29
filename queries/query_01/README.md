## **List of Reservations: Retrieve all reservations for a specific customers.** ##


### **SQL** ###

```sql
USE RestaurantReservationDB;
GO

SELECT * FROM Reservations r INNER JOIN Customers c
ON r.CustomerId = c.CustomerId 
WHERE c.CustomerId IN (1, 5, 20, 43);
GO
```

### **Rationale behind the query** ###
I need all reservations for a specific customers, so I have to retrive a specific records using ```IN``` or a range of records using ```BETWEEN```.

