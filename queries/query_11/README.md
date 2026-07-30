## **Database Function - Calculate Restaurant Revenue** ##

### **Description** ###

- **Function Name**: **`fn_CalculateRevenue`**
- **Purpose**: Compute revenue made by a specific restaurant.
- **Parameter**: `RestaurantId`
- **Return**: total revenue amount for the `RestaurantId` .

### **Database Function** ###

```sql
USE RestaurantReservationDB; 
GO

ALTER FUNCTION fn_CalculateRevenue(@RestaurantId DECIMAL(9,6))
RETURNS FLOAT
AS
BEGIN
    DECLARE @TotalRevenue FLOAT = 0.0;
    SELECT @TotalRevenue = SUM(o.TotalAmount) FROM Orders o INNER JOIN Reservations r ON o.ReservationId=r.ReservationId WHERE r.RestaurantId=@RestaurantId GROUP BY r.RestaurantId;

    RETURN @TotalRevenue;
END;
```

### **SQL Query** ###

```sql
USE RestaurantReservationDB; 
GO

SELECT dbo.fn_CalculateRevenue(2) AS TotalRevenue; 
```

### **Rationale behind the query** ###

To define the function I used ```CREATE``` and to update it I used ```ALTER```.

To get the total amount from the orders for a restuarnat I should make ```INNER JOIN``` between the orders and reservations tables.

To calculate the sum, I used ```SUM``` aggregate function with ```GROUP BY``` the restaurant id, and stored the result in ```@TotalRevenue```, then returned it.

To use this user defined function (database function), I called dbo which is the shcema name that it is belong to.

The function stored inside Databases -> ```RestaurantReservationDB``` -> Programmability -> Functions -> Scalar-valued Functions.




