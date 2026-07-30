## **Stored Procedure - Add New Order** ##

### **Description** ###

- **Procedure Name**: **`sp_AddNewOrder`**
- **Purpose**: Streamline the process of adding a new order.
- **Parameters**: **`ReservationId`**, **`EmployeeId`**, **`OrderDate`**, and **`TotalAmount`**.
- **Implementation**: Check if the specified reservation and employee exist, if not, return an error message, if existing, add new order.
- **Return**: The new **`BorrowerID`** or an error message.

### **Stored Procedure** ###

```sql
USE RestaurantReservationDB;
GO

ALTER PROCEDURE sp_AddNewOrder
     @ReservationId INT,
     @EmployeeId INT,
     @OrderDate DATETIME,
     @TotalAmount FLOAT
AS
BEGIN
    DECLARE @RID INT;
    DECLARE @EID INT;
    DECLARE @OID INT;
    DECLARE @Message NVARCHAR(100);

    SELECT @EID=EmployeeId FROM Employees WHERE EmployeeId=@EmployeeId; 
    IF @EID IS NULL
          BEGIN
              SELECT 'The employee does not exist' AS Message;
              RETURN;
          END;

    SELECT @RID=ReservationId FROM Reservations WHERE ReservationId=@ReservationId; 
    IF @RID IS NULL
          BEGIN
              SELECT 'The reservation dose not exists' AS Message;
              RETURN;
          END;

    INSERT INTO Orders (ReservationId, EmployeeId, OrderDate, TotalAmount)
    VALUES (
        @ReservationId,
        @EmployeeId,
        @OrderDate,
        @TotalAmount
    );

    SELECT TOP 1 * 
    FROM Orders 
    ORDER BY OrderId DESC;

END;
```

### **SQL Query** ###

```sql
USE RestaurantReservationDB;
GO

EXEC dbo.sp_AddNewOrder
    455,
    30,
    '2026-07-31',
    125.93;

    EXEC dbo.sp_AddNewOrder
    455,
    1000,
    '2026-07-31',
    125.93;

     EXEC dbo.sp_AddNewOrder
    10000,
    30,
    '2026-07-31',
    125.93;

    EXEC dbo.sp_AddNewOrder
    10000,
    1000,
    '2026-07-31',
    125.93;

```

### **Rationale behind the query** ###

I defined a stored procedure ```sp_AddNewOrder``` Using ```CREATE```, and updated it using ```ALTER```, that get 4 params (```@ReservationId```, ```@EmployeeId```, ```@OrderDate```, and ```@TotalAmount```).

I used ```SELECT``` to validate the ```@EmployeeId``` and ```@ReservationId``` if they are ```NULL``` the sp returns error message.

I used ```INSERT``` to add new Order.

I used ```SELECT TOP 1 *  FROM Orders ORDER BY OrderId DESC;``` to get the last order that inserted recentley.

To execute the sp I use ```EXEC```.




