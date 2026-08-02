INSERT INTO Reservations (RestaurantId, CustomerId, TableId, ReservationDate, PartySize)
    VALUES (
        30,
        158,
        60,
        DATEADD(DAY, 10, GETDATE()),
        (ABS(CHECKSUM(NEWID())) % 5) + 1
 );

SELECT * FROM AuditLog;
