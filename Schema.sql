CREATE DATABASE RestaurantReservationDB;
GO

USE RestaurantReservationDB;
GO

CREATE TABLE Restaurants
(
    RestaurantId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Address NVARCHAR(150) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    OpeningHours NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE MenuItems
(
    ItemId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_MenuItems_Restaurants FOREIGN KEY (RestaurantId) 
        REFERENCES Restaurants(RestaurantId)
);
GO

CREATE TABLE Employees
(
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Position NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_Employees_Restaurants FOREIGN KEY (RestaurantId) 
        REFERENCES Restaurants(RestaurantId)
);

CREATE TABLE Tables
(
    TableId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    Capacity INT NOT NULL,
    CONSTRAINT FK_Tables_Restaurants FOREIGN KEY (RestaurantId) 
        REFERENCES Restaurants(RestaurantId)
);
GO


CREATE TABLE Customers
(
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL
);
GO

CREATE TABLE Reservations
(
    ReservationId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    CustomerId INT NOT NULL,
    TableId INT NOT NULL,
    ReservationDate DATETIME DEFAULT GETDATE(),
    PartySize INT NOT NULL,
    CONSTRAINT FK_Reservations_Restaurants FOREIGN KEY (RestaurantId) 
        REFERENCES Restaurants(RestaurantId),
    CONSTRAINT FK_Reservations_Customers FOREIGN KEY (CustomerId) 
        REFERENCES Customers(CustomerId),
    CONSTRAINT FK_Reservations_Tables FOREIGN KEY (TableId) 
        REFERENCES Tables(TableId)
);
GO

CREATE TABLE Orders
(
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    ReservationId INT NOT NULL,
    EmployeeId INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_Orders_Reservations FOREIGN KEY (ReservationId) 
        REFERENCES Reservations(ReservationId),
    CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeId) 
        REFERENCES Employees(EmployeeId)
);
GO

CREATE TABLE OrderItems
(
    OrderItemId INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL,
    ItemId INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderId) 
        REFERENCES Orders(OrderId),
    CONSTRAINT FK_OrderItems_MenuItems FOREIGN KEY (ItemId) 
        REFERENCES MenuItems(ItemId)
);
GO