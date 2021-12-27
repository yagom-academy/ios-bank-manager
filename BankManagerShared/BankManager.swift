import Foundation

class BankManager {
    static let shared: BankManager = {
        let instance = BankManager()
        
        return instance
    }()
    
    func lineUpCustomers() -> Queue<Customer> {
        let range = 10...30
        let customerCount = Int.random(in: range)
        let customerQueue: Queue<Customer> = Queue<Customer>()
        
        (1...customerCount).forEach {
            let customer = Customer(customerNumber: $0)
            customerQueue.enqueue(customer)
        }
        return customerQueue
    }
}
