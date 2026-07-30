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

