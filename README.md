## **Restaurant Reservation Management System: Database Project**

## **Background**:

A group of restaurants wishes to transition from their traditional ordering and reservation system to a more robust digital platform. They are looking for a system that can efficiently manage their restaurant operations, including tracking orders, menu items, reservations, and more.

## **Objective**:

Design and implement a relational database using MS SQL that supports the restaurant’s operations and offers extensive querying capabilities.

## **Design the Relational Schema**:

- **Restaurants**:
    - RestaurantId (PK)
    - Name
    - Address
    - PhoneNumber
    - OpeningHours
- **MenuItems:**
    - ItemId (PK)
    - RestaurantId (FK)
    - Name
    - Description
    - Price
- **OrderItems**:
    - OrderItemId (PK)
    - OrderId (FK)
    - ItemId
    - Quantity
- **Orders:**
    - OrderId (PK)
    - ReservationId (FK)
    - EmployeeId (FK)
    - OrderDate
    - TotalAmount
- **Employees**:
    - EmployeeId (PK)
    - RestaurantId (FK)
    - FirstName
    - LastName
    - Position
- **Reservations**:
    - ReservationId (PK)
    - CustomerId (FK)
    - RestaurantId (FK)
    - TableId (FK)
    - ReservationDate
    - PartySize
- **Customers**:
    - CustomerId (PK)
    - FistName
    - LastName
    - Email
    - PhoneNumber
- **Tables**:
    - TableId (PK)
    - RestaurantId (FK)
    - Capacity

## **Seed Data**:   
Seed with fictional data: Populate 50 restaurants, 1000 menu items, and 1500 order items, 500 orders, 100 employees, 500 reservations, 400 customers, 100 tables records. The data generated using stored procedures to run it any time with T-SQL scripts.