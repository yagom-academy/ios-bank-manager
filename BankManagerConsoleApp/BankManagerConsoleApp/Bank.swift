struct Bank {
    private var time: Double
    private var customerQueue: CustomerQueue<Customer>
    private var bankManager: BankManager

    func excuteWork() {
        let total = Int.random(in: 10...30)
        appendCustomerQueue(numbers: total)
        for _ in 1...total {
            do {
                let customer = try customerQueue.dequeue()
                bankManager.work(customer: customer, time: 0.7)
            } catch {
                break
            }
        }
        printCloseMessage()
    }

    private func appendCustomerQueue(numbers: Int) {
        for number in 1...numbers {
            customerQueue.enqueue(data: Customer(name: "\(number)번"))
        }
    }

    private func printCloseMessage() {
    }
}
