USE RestaurantReservationDB;
GO

CREATE TRIGGER tr_Logging
ON Reservations
AFTER INSERT
AS
BEGIN

   INSERT INTO AuditLog (RestaurantId, TableId, ReservationDate) 
   SELECT RestaurantId, TableId, ReservationDate
   FROM inserted;

END;

