struct Bank {
    private var time: Double
    private var customerQueue: CustomerQueue<Customer>
    private var bankManager: BankManager

    func excuteWork() {
        let count = createRandom()
        for _ in 1...count {
            bankManager.work()
        }
        printCloseMessage()
    }

    private func createRandom() -> Int {
        return 0
    }

    private func printCloseMessage() {
    }
}
