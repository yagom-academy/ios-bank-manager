import Foundation

struct Bank {
    private let bankers: [Banker]
    private var customerQueue: Queue<Customer>
    private let bankManager: BankManager
    
    init(bankers : [Banker], customerQueue: Queue<Customer>, bankManager: BankManager) {
        self.bankers = bankers
        self.customerQueue = customerQueue
        self.bankManager = bankManager
    }
}

// MARK: - method

extension Bank {
    mutating func operate() {
        bankManager.startTimeCheck()
        open()
        bankManager.endTimeCheck()
        close()
        bankManager.clearTotalValues()
    }
    
    private mutating func open() {
        guard let banker = bankers.first else { return }
        while let customer = customerQueue.dequeue() {
            assign(customer: customer, to: banker)
        }
    }
    
    private func close() {
        let totalTimeText: String = String(format: "%.2f", bankManager.totalTime)
        let totalCustomer: Int = bankManager.totalCustomer
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTimeText)초입니다.")
    }
    
    private func assign(customer: Customer, to banker: Banker) {
        banker.task(of: customer)
        bankManager.increaseTotalCustomer()
    }
}
