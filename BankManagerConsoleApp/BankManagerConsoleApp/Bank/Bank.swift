import Foundation

struct Bank {
    private var totalcount = 0
    private(set) var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())

    init() {}

    func popCustomer() throws ->  Customer {
        let customer = try customerQueue.dequeue()
        return customer
    }

    mutating func setCustomer(count: Int) {
        (1...count).forEach { number in
            totalcount += 1
            customerQueue.enqueue(data: Customer(name: "\(totalcount)"))
        }
    }
    
    mutating func reset() {
        totalcount = 0
        customerQueue.clear()
    }
}
