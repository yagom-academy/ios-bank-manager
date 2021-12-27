import Foundation

struct Bank {
    private let bankers: [Banker]
    private var customerQueue: Queue<Customer>?
    private var totalTime: TimeInterval
    private var totalCustomer: Int
    
    private init(bankers : [Banker]) {
        self.bankers = bankers
        self.totalTime = 0
        self.totalCustomer = 0
    }
    
    init() {
        self.init(bankers: [GeneralBanker()])
    }

    init(bankerCount: Int) {
        var bankerQueue:[Banker] = []
        for _ in 0...bankerCount {
            bankerQueue.append(GeneralBanker())
        }
        self.init(bankers: bankerQueue)
    }
}

// MARK: - method

extension Bank {
    mutating func run() {
        close()
        assignQueue()
    }
    
    private mutating func assignQueue() {
        customerQueue = BankManager.shared.lineUpCustomers()
    }
    
    private func close() {
        let totalTimeText: String = String(format: "%.2f", totalTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTimeText)초입니다.")
    }
    
    private func assign(customer: Customer, to banker: Banker) {
        banker.task(of: customer)
    }
}
