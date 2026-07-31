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

