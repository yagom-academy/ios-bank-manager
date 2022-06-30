struct Bank {
    private var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())
    private var bankManager = BankManager()

    func excuteWork() {
        var time: Double = 0
        let total = Int.random(in: 10...30)
        print(total)
        appendCustomerQueue(numbers: total)
        for _ in 1...total {
            do {
                let customer = try customerQueue.dequeue()
                bankManager.work(customer: customer, time: 0.7)
                time += 0.7
            } catch {
                break
            }
        }
        printCloseMessage(number: total, time: time)
    }

    private func appendCustomerQueue(numbers: Int) {
        for number in 1...numbers {
            customerQueue.enqueue(data: Customer(name: "\(number)번"))
        }
    }

    private func printCloseMessage(number: Int, time: Double) {
        let convertedTime = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(number)명이며, 총 업무시간은 \(convertedTime)초 입니다.")
    }
}
