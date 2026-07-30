USE RestaurantReservationDB;
GO

EXEC dbo.sp_AddNewOrder
    455,
    30,
    '2026-07-31',
    125.93;

    EXEC dbo.sp_AddNewOrder
    455,
    1000,
    '2026-07-31',
    125.93;

     EXEC dbo.sp_AddNewOrder
    10000,
    30,
    '2026-07-31',
    125.93;

    EXEC dbo.sp_AddNewOrder
    10000,
    1000,
    '2026-07-31',
    125.93;
