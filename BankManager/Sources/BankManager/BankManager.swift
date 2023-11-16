import Foundation

public struct BankManager {

    public init() {
    }
    
    public func giveWaitingTicket(customerNumber: Double, customerLine: CustomerQueue<Customer>) {
        for i in 1...Int(customerNumber) {
            let customer = Customer(watingTicket: i)
            customerLine.enqueue(data: customer)
        }
    }
}
