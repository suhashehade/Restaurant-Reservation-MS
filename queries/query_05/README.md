## **Calculate Average Order Amount: Calculate the average order amount made through a specific employee.** ##


### **SQL** ###

```sql
USE RestaurantReservationDB;
GO

SELECT AVG(TotalAmount) AS AVG FROM Orders
WHERE EmployeeId=52;
GO
```

### **Rationale behind the query** ###

Use ```AVG``` Aggregate function to calculate the Avgarage of orders amounts that made by a specific employee with position 'Waiter'.
It should return ```NULL``` if the emolpyee is 'Chef' or 'Manager'.
