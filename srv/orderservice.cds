using { com.customerorders_v1 as me } from '../db/schema';
service orderservice {
   // Exposing the header entity automatically grants deep path access to its items
    entity SalesOrders as projection on me.SalesOrders;
    entity SalesOrderItems as projection on me.OrderItems;

}