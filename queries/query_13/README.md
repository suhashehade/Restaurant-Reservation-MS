## **Stored Procedure - Reserved Tables Report** ##

### **Description** ###

- **Procedure Name**: **`sp_ResrvedTablesReport`**
- **Purpose**: Generate a report of tables reserved within a specified date range.
- **Parameters**: **`StartDate`**, **`EndDate`**
- **Implementation**: Retrieve all tables reserved within the given range, with details like reservation date, party size and restaurant details.
- **Return**: Tabulated report of reserved tables.

### **Stored Procedure** ###

```sql
USE RestaurantReservationDB;
GO

ALTER PROCEDURE sp_ResrvedTablesReport
     @StartDate DATETIME,
     @EndDate DATETIME
AS
BEGIN
    
    SELECT res.ReservationId, res.ReservationDate, res.PartySize, t.TableId, t.Capacity, rest.RestaurantId, rest.Address, rest.Name
    FROM Reservations res INNER JOIN Tables t ON res.TableId=t.TableId 
    INNER JOIN Restaurants rest ON res.RestaurantId=rest.RestaurantId WHERE res.ReservationDate BETWEEN @StartDate AND @EndDate;
END;
```

### **SQL Query** ###

```sql
USE RestaurantReservationDB;
GO

EXEC dbo.sp_ResrvedTablesReport
    '2026-07-01',
    '2026-08-31';
```

### **Rationale behind the query** ###

I defined a stored procedure ```sp_ResrvedTablesReport``` Using ```CREATE```, and updated it using ```ALTER```, that get 2 params (```@StartDate```, ```@EndDate```).

I used ```INNER JOIN``` between the tabels: ```Reservations```, ```Tabels```, and ```Restaurants``` to get all details from all of them.

I used ```BETWEEN``` Comparison Operator which returns the rows in the range.

To execute the sp I use ```EXEC```.




