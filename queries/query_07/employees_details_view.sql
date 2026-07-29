USE RestaurantReservationDB;
GO

ALTER VIEW Employees_Details AS 
SELECT
    e.EmployeeId,
    e.FirstName,
    e.LastName,
    e.Position,
    r.RestaurantId,
    r.Name AS RestaurantName
FROM Employees e 
INNER JOIN Restaurants r ON e.RestaurantId = r.RestaurantId;