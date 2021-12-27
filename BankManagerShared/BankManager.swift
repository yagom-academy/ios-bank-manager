import Foundation

class BankManager {
    static let shared: BankManager = {
        let instance = BankManager()
        
        return instance
    }()
    
    var totalTime: TimeInterval = 0
    var totalCustomer: Int = 0
    
    func lineUpCustomers() -> Queue<Customer> {
        let range = 10...30
        let customerCount = Int.random(in: range)
        let customerQueue: Queue<Customer> = Queue<Customer>()
        
        (0..<customerCount).forEach {
            let customer = Customer(customerNumber: $0 + 1)
            customerQueue.enqueue(customer)
        }
        return customerQueue
    }
    
    func startTimeCheck() {
        totalTime -= Date().timeIntervalSinceReferenceDate
    }
    
    func endTimeCheck() {
        totalTime += Date().timeIntervalSinceReferenceDate
    }
    
    func increaseTotalCustomer() {
        self.totalCustomer += 1
    }
    
    func clearTotalValues() {
        self.totalTime = 0
        self.totalCustomer = 0
    }
}
