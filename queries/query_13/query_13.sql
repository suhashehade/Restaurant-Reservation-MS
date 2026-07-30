USE RestaurantReservationDB;
GO

EXEC dbo.sp_ResrvedTablesReport
    '2026-07-01',
    '2026-08-31';