## **Database Function - Calculate Employees Salary** ##

### **Description** ###

- **Function Name**: **`fn_CalculateEmployeeSalary`**
- **Purpose**: Compute the salary for a given employee.
- **Parameter**: `EmployeeId`
- **Implementation**: Salary is defined as: # number of orders made by specific employee * employee rank.
    - Employee’s rank based on position: Position = `VIPOrdersWaiter` = 5, `StandardWaiter` = 4, `AssistantWaiter`  = 3.
- **Return**: salary for the `EmployeeId`.

### **Database Function** ###

```sql
USE RestaurantReservationDB; 
GO

ALTER FUNCTION fn_CalculateEmployeeSalary(@EmployeeId DECIMAL(9,6))
RETURNS INT
AS
BEGIN
    DECLARE @EmployeeSalary INT = 0;
    DECLARE @EmployeePosition NVARCHAR(100);
    DECLARE @EmployeeRank INT;

    SELECT @EmployeePosition = Position FROM Employees WHERE EmployeeId=@EmployeeId;

    IF @EmployeePosition = 'VIPOrdersWaiter'
       SET @EmployeeRank = 5;
    ELSE IF @EmployeePosition = 'StandardWaiter'
       SET @EmployeeRank = 4;
    ELSE IF @EmployeePosition = 'AssistantWaiter'
       SET @EmployeeRank = 3;
    ELSE
       SET @EmployeeRank = 0;

    SELECT @EmployeeSalary = COUNT(*) * @EmployeeRank  FROM Orders WHERE EmployeeId=@EmployeeId GROUP BY EmployeeId;

    RETURN @EmployeeSalary;
END;
```

### **SQL Query** ###

```sql
USE RestaurantReservationDB; 
GO

SELECT dbo.fn_CalculateEmployeeSalary(2) AS EmployeeSalary; 
```

### **Rationale behind the query** ###

To define the function I used ```CREATE``` and to update it I used ```ALTER```.

To get the employee's position I applied query ```SELECT```, and stored the retured value in ```EmployeePosition```.

To assign the rank I used ```IF```/ ```ELSE```, and stored the employee's rank in ```@EmployeeRank```.

To calculate the number of the orders prepared by an employee, I used ```COUNT``` aggregate function with ```GROUP BY``` the employee id.

To calculate the salary I mutiplied the number of orders for an employee by the employee's rank, then return the value.

To use this user defined function (database function), I called dbo which is the shcema name that it is belong to.

The function stored inside Databases -> ```RestaurantReservationDB``` -> Programmability -> Functions -> Scalar-valued Functions.




