import Foundation

struct Bank {
    private var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())

    init() {
        enqueueCustomer()
    }

    func executeWork(during workTime: TimeInterval) -> Int {
        var totalCustomer = 0
        (0..<customerQueue.count).forEach { _ in
            do {
                let customer = try customerQueue.dequeue()
                BankManager.work(for: customer, during: workTime)
                totalCustomer += 1
            } catch {
                print("고객이 없습니다.")
                return
            }
        }
        return totalCustomer
    }

    private func enqueueCustomer() {
        (0..<Int.random(in: 10...30)).forEach { number in
            customerQueue.enqueue(data: Customer(name: "\(number + 1)번"))
        }
    }
}
