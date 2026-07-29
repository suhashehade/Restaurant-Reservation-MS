## **List of Managers: Retrieve all employees holding Manager position.** ##


### **SQL** ###

```sql
USE RestaurantReservationDB;
GO

SELECT * FROM Employees
WHERE Position='Manager';
```

### **Rationale behind the query** ###
Retrieve all managers using ```WHERE```.

