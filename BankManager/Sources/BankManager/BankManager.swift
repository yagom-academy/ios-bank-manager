public struct BankManager<BankClerk: Receivable> {
    private let customerQueue = CustomerQueue<CustomerNumbering>(list: LinkedList<CustomerNumbering>())
    
    public func standBy(customer: CustomerNumbering) {
        customerQueue.enqueue(customer)
    }
    
    public func assignCustomer(to bankClerk: BankClerk) {
        while let customer = customerQueue.dequeue() as? BankClerk.Customer {
            bankClerk.receive(customer: customer)
        }
    }
}
