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

