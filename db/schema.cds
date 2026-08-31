namespace com.customerorders_v1;

using { cuid, managed } from '@sap/cds/common';

// Header Entity
entity SalesOrders : cuid, managed {
    orderNumber : String;
    customer    : String;
    totalAmount : Decimal(10, 2);
    // Composition links Header to Items lifecycle
    Items       : Composition of many OrderItems on Items.parent = $self;
}

// Item Entity
entity OrderItems : cuid {
    parent      : Association to SalesOrders; // Back-link to parent header
    product     : String;
    quantity    : Integer;
    price       : Decimal(10, 2);
}

//Note: cuid automatically provides a UUID as a primary key ID, 
//and managed automatically tracks creation and modification timestamps.