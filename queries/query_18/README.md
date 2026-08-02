## **Indexing** ##

### **Description** ###

Make Tech-Lib Faster:
    Create the needed Indexes to the the project you built earlier.

### **SQL Query** ###

```sql
USE RestaurantReservationDB; 
GO

CREATE INDEX OrderItems_OrderId
ON OrderItems(OrderId);

CREATE INDEX OrderItems_ItemId
ON OrderItems(ItemId);

CREATE INDEX Orders_ReservationId
ON Orders(ReservationId);

CREATE INDEX Reservations_RestaurantId
ON Reservations(RestaurantId);

```

### **Rationale behind the query** ###

Make the FKs: ```OrderItems.OrderId```, ```OrderItems.ItemId```, ```Orders.ReservationId```, and ```Reservations.RestaurantId``` as indexes to enhance the performance, to avoid Hash Match, Sort costing.






