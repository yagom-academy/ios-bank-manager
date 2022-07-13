import Foundation

struct Bank {
    private var totalCount = 0
    private(set) var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())

    init() {}

    func popCustomer() throws ->  Customer {
        let customer = try customerQueue.dequeue()
        return customer
    }

    mutating func setCustomer(count: Int) {
        (1...count).forEach { _ in
            totalCount += 1
            customerQueue.enqueue(data: Customer(name: "\(totalCount)"))
        }
    }
    
    mutating func reset() {
        totalCount = 0
        customerQueue.clear()
    }
}
