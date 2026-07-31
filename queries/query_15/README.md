## **SQL Stored Procedure with Temp Table** ##

### **Description** ###

Design a stored procedure that retrieves all tables which have future reservations. Store these tables in a temporary table, then join this temp table with the Restaurants table to list out the specific information about the associated restaurants.

### **Stored Procedure** ###

```sql
USE RestaurantReservationDB;
GO

ALTER PROCEDURE sp_FutureReservationsTabels
    
AS
BEGIN
        SELECT t.TableId, t.RestaurantId, t.Capacity, r.ReservationId, r.PartySize, r.ReservationDate, r.CustomerId 
        INTO #TempTable
        FROM [Tables] t INNER JOIN Reservations r ON t.TableId=r.TableId
        WHERE r.ReservationDate > GETDATE()
    
    SELECT fr.TableId, fr.ReservationDate, r.RestaurantId, r.Name, r.Address, r.PhoneNumber, r.OpeningHours  
    FROM #TempTable fr INNER JOIN Restaurants r ON fr.RestaurantId=r.RestaurantId;
END;
```

### **SQL Query** ###

```sql
USE RestaurantReservationDB;
GO

EXEC dbo.sp_FutureReservationsTabels;
```

### **Rationale behind the query** ###

I defined a stored procedure ```sp_FutureReservationsTabels``` Using ```CREATE```, and updated it using ```ALTER```, that make a temp table ```#TempTable``` that contains all tabels that have future reservations using ```INNER JOIN```, and then make ```INNER JOIN``` with the ```Restaurants``` table to get the details of the associated restaurants.

I used ```SELECT```...```INTO``` to add the reseult of the ```INNER JOIN``` into a temp table ```#TempTable```.

To execute the sp I use ```EXEC```.




