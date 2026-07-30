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
