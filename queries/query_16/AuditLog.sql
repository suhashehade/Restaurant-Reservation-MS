USE RestaurantReservationDB;
GO

CREATE TABLE AuditLog 
(
    AuditLogId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    TableId INT NOT NULL,
    ReservationDate DATETIME DEFAULT GETDATE() NOT NULL,
    ChangeDate DATETIME DEFAULT GETDATE() NOT NULL
);
GO