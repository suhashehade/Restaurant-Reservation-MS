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
