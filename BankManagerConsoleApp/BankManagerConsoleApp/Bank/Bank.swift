import Foundation

struct Bank {
    private(set) var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())

    init() {
        setCustomer()
    }

    func popCustomer() throws ->  Customer {
        let customer = try customerQueue.dequeue()
        return customer
    }

    private func setCustomer() {
        (0..<Int.random(in: 10...30)).forEach { number in
            customerQueue.enqueue(data: Customer(name: "\(number + 1)번"))
        }
    }
}
