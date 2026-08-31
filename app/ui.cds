using {orderservice} from '../srv/orderservice';

annotate orderservice.SalesOrders with @(
    UI.HeaderInfo     : {
        TypeName      : 'SalesOrder',
        TypeNamePlural: 'SalesOrder',
        Title         : 'Sales Order Overview'
    },
    UI.SelectionFields: [
        customer,
        orderNumber
    ],
    UI.LineItem       : [
        {
            Value         : orderNumber,
            Label         : 'Order',
            @UI.Importance: #High
        },
        {
            Value: Items.product,
            Label: 'Product Name'
        },
        {
            Value: Items.quantity,
            Label: 'Quantity'
        },
        {
            Value         : Items.price,
            Label         : 'Price',
            @UI.Importance: #High,
        }
        
    ],
           UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Info',
            Target : '@UI.FieldGroup#GeneralInfo'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Order Items',
            Target : 'Items/@UI.LineItem'
        }
    ],
     UI.FieldGroup #GeneralInfo : {
        Data : [ { Value : customer }, { Value : orderNumber } ]
    }
);

annotate orderservice.SalesOrderItems with @(
    UI.LineItem:[
        {
            Value: product,
            Label: 'Product Name'
        },
        {
            Value: quantity,
            Label: 'Quantity'
        },
        {
            Value         : price,
            Label         : 'Price',
            @UI.Importance: #High,
        }
    ]
);

