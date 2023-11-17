
public struct BankManager {

    public init() {
    }
    
    public func giveWaitingTicket(customerNumber: Int, customerLine: CustomerQueue<Customer>) {
        for i in 1...customerNumber {
            let customer = Customer(watingTicket: i)
            customerLine.enqueue(data: customer)
        }
    }
}
