USE RestaurantReservationDB;
GO

SELECT AVG(TotalAmount) AS AVG FROM Orders
WHERE EmployeeId=52;
GO