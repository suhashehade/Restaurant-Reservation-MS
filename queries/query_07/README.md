## **Retrieve Employees details with Views: Use a view to list all employees information including their restaurants details** ##

### **SQL View** ###

```sql
USE RestaurantReservationDB;
GO

ALTER VIEW Employees_Details AS 
SELECT
    e.EmployeeId,
    e.FirstName,
    e.LastName,
    e.Position,
    r.RestaurantId,
    r.Name AS RestaurantName,
    r.PhoneNumber,
    r.OpeningHours
FROM Employees e 
INNER JOIN Restaurants r ON e.RestaurantId = r.RestaurantId;
```

### **SQL Query** ###

```sql
USE RestaurantReservationDB;
GO

SELECT * FROM Employees_Details;
GO
```

### **Rationale behind the query** ###

Use View to retrieve the list of employees with their restaurants details.

Use ```CREATE VIEW``` for the first time of view creation and use ```ALTER VIEW``` to run the file again.

Run the ```SELECT``` on the virtual table ```Employees_Details```.
