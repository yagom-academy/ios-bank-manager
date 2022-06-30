struct Bank {
    private var time: Double
    private var customerQueue: CustomerQueue<Customer>
    private var bankManager: BankManager

    func excuteWork() {
        let total = Int.random(in: 10...30)
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

    private func createRandom() -> Int {
        return 0
    }

    private func printCloseMessage() {
    }
}
