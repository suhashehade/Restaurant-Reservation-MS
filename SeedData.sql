USE RestaurantReservationDB;
GO


DELETE FROM OrderItems;
DELETE FROM Orders;
DELETE FROM Reservations;
DELETE FROM MenuItems;
DELETE FROM Customers;
DELETE FROM [Tables];
DELETE FROM Employees;
DELETE FROM Restaurants;

DBCC CHECKIDENT ('OrderItems', RESEED, 0);
DBCC CHECKIDENT ('Orders', RESEED, 0);
DBCC CHECKIDENT ('Reservations', RESEED, 0);
DBCC CHECKIDENT ('MenuItems', RESEED, 0);
DBCC CHECKIDENT ('Customers', RESEED, 0);
DBCC CHECKIDENT ('[Tables]', RESEED, 0);
DBCC CHECKIDENT ('Employees', RESEED, 0);
DBCC CHECKIDENT ('Restaurants', RESEED, 0);
GO


DECLARE @i INT = 1;
DECLARE @RestId INT;
DECLARE @TableId INT;
DECLARE @OrderId INT;
DECLARE @OrderRestId INT;
DECLARE @ItemId INT;
DECLARE @ResId INT;
DECLARE @WaiterId INT;


SET @i = 1;
WHILE @i <= 50 
BEGIN
    INSERT INTO Restaurants (Name, Address, PhoneNumber, OpeningHours)
    VALUES (
        N'Restaurant ' + CAST(@i AS NVARCHAR),
        N'Street ' + CAST((@i * 3) AS NVARCHAR) + N', Downtown',
        '079' + RIGHT('0000000' + CAST(@i AS VARCHAR), 7),
        '08:00 AM - 11:00 PM'
    );
    SET @i = @i + 1;
END; 


SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Employees (RestaurantId, FirstName, LastName, Position)
    VALUES (
        ((@i - 1) % 50) + 1,
        N'EmpFirst' + CAST(@i AS NVARCHAR),
        N'EmpLast' + CAST(@i AS NVARCHAR),
        CASE WHEN @i % 3 = 0 THEN N'Manager' WHEN @i % 3 = 1 THEN N'Waiter' ELSE N'Chef' END
    );
    SET @i = @i + 1;
END;


SET @i = 1;
WHILE @i <= 100
BEGIN
   INSERT INTO [Tables] (RestaurantId, Capacity)
   VALUES (
        ((@i - 1) % 50) + 1,
        (ABS(CHECKSUM(NEWID())) % 6) + 2
   );
   SET @i = @i + 1;
END;


SET @i = 1;
WHILE @i <= 400
BEGIN
   INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
   VALUES (
        N'Customer' + CAST(@i AS NVARCHAR),
        N'LastName' + CAST(@i AS NVARCHAR),
        'customer' + CAST(@i AS VARCHAR) + '@example.com',
        '078' + RIGHT('0000000' + CAST(@i AS VARCHAR), 7)
   );
   SET @i = @i + 1;
END;


SET @i = 1;

WHILE @i <= 1000
BEGIN
  SET @RestId = (ABS(CHECKSUM(NEWID())) % 50) + 1;

  INSERT INTO MenuItems (RestaurantId, Name, Description, Price)
  VALUES (
        @RestId,
        N'Item ' + CAST(@i AS NVARCHAR),
        N'Delicious dish description ' + CAST(@i AS NVARCHAR),
        CAST((ABS(CHECKSUM(NEWID())) % 45 + 5) + 0.99 AS DECIMAL(10,2))
  );
  SET @i = @i + 1;
END;



SET @i = 1;
WHILE @i <= 500
BEGIN
    SET @RestId = (ABS(CHECKSUM(NEWID())) % 50) + 1;
    SET @TableId = (@RestId * 2) - (@i % 2);

    INSERT INTO Reservations (RestaurantId, CustomerId, TableId, ReservationDate, PartySize)
    VALUES (
        @RestId,
        ((@i - 1) % 300) + 1,
        @TableId,
        DATEADD(DAY, - (@i % 60) + 15, GETDATE()),
        (ABS(CHECKSUM(NEWID())) % 5) + 1
    );
    SET @i = @i + 1;
END;


SET @i = 1;
WHILE @i <= 500
BEGIN
    IF @i <= 300
    BEGIN
        SET @ResId = @i + 100;
    END
    ELSE
    BEGIN
        SET @ResId = ((@i - 301) % 100) + 401;
    END

    SELECT @RestId = RestaurantId FROM Reservations WHERE ReservationId = @ResId;

    SELECT TOP 1 @WaiterId = EmployeeId 
    FROM Employees 
    WHERE RestaurantId = @RestId AND Position = N'Waiter';

    INSERT INTO Orders (ReservationId, EmployeeId, OrderDate, TotalAmount)
    VALUES (
        @ResId,
        @WaiterId,
        DATEADD(MINUTE, (@i * 5), GETDATE()),
        0.00
    );
    SET @i = @i + 1;
END;


SET @i = 1;
WHILE @i <= 1500
BEGIN
    SET @OrderId = ((@i - 1) / 3) + 1; 
    
    SELECT @OrderRestId = R.RestaurantId 
    FROM Orders O 
    JOIN Reservations R ON O.ReservationId = R.ReservationId 
    WHERE O.OrderId = @OrderId;

    SET @ItemId = ((@OrderRestId - 1) * 20) + ((@i % 20) + 1);

    INSERT INTO OrderItems (OrderId, ItemId, Quantity)
    VALUES (
        @OrderId,
        @ItemId,
        (ABS(CHECKSUM(NEWID())) % 4) + 1
    );
    SET @i = @i + 1;
END;


UPDATE O
SET O.TotalAmount = ISNULL(T.CalculatedTotal, 0)
FROM Orders O
JOIN (
    SELECT OI.OrderId, SUM(OI.Quantity * M.Price) AS CalculatedTotal
    FROM OrderItems OI
    JOIN MenuItems M ON OI.ItemId = M.ItemId
    GROUP BY OI.OrderId
) T ON O.OrderId = T.OrderId;

PRINT 'Database successfully seeded with realistic ERD cardinality scenarios!';
GO