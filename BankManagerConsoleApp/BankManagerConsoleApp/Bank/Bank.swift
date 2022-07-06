import Foundation

struct Bank {
    private(set) var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())

    init(count: Int) {
        setCustomer(count: count)
    }

    func popCustomer() throws ->  Customer {
        let customer = try customerQueue.dequeue()
        return customer
    }

    private func setCustomer(count: Int) {
        (0..<count).forEach { number in
            customerQueue.enqueue(data: Customer(name: "\(number + 1)번"))
        }
    }
}
