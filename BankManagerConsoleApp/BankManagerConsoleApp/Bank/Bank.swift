import Foundation

struct Bank {
    private var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())

    init() {
        setCustomer()
    }

    func executeWork(during workTime: TimeInterval) throws -> Int {
        var totalCustomer = 0
        for _ in 0..<customerQueue.count {
            let customer = try customerQueue.dequeue()
            BankManager.work(for: customer, during: workTime)
            totalCustomer += 1
        }
        return totalCustomer
    }

    private func setCustomer() {
        (0..<Int.random(in: 10...30)).forEach { number in
            customerQueue.enqueue(data: Customer(name: "\(number + 1)번"))
        }
    }
}
