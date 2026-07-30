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
