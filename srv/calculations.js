import cds from '@sap/cds';
export default cds.service.impl(async function() {
    // Extract the exposed entities
    const { SalesOrders } = this.entities

    // Intercept data right BEFORE a new Sales Order is inserted
    this.before('CREATE', SalesOrders, (req) => {
        const order = req.data

        // If the payload contains line items, calculate the grand total
        if (order.Items && order.Items.length > 0) {
            order.totalAmount = order.Items.reduce((accumulator, item) => {
                return accumulator + (item.quantity * item.price)
            }, 0)
        } else {
            order.totalAmount = 0
        }
    })
})
