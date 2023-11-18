
struct BankManager {
    
    func giveWaitingTicket(customerNumber: Int, customerLine: CustomerQueue<Customer>) {
        for i in 1...customerNumber {
            let customer = Customer(waitingTicket: i)
            customerLine.enqueue(customer: customer)
        }
    }
}
