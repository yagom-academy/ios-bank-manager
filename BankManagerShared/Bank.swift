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
        let loanBankerCount = bankers
                                .filter{ $0.taskType == .loan }
                                .count
        let depositBankerCount = bankers
                                .filter { $0.taskType == .deposit }
                                .count
        
        let bankerGroup = DispatchGroup()
        
        let loanSemaphore = DispatchSemaphore(value: loanBankerCount)
        let depositSemaphore = DispatchSemaphore(value: depositBankerCount)
        
        let loanDispatchQueue = DispatchQueue.global()
        let depositDispatchQueue = DispatchQueue.global()
        
        while let customer = customerQueue.dequeue() {
            switch customer.taskType {
            case .deposit:
                assign(dispatchQueue: depositDispatchQueue, semaphore: depositSemaphore, group: bankerGroup, customer: customer, banker: DepositBanker())
            case .loan:
                assign(dispatchQueue: loanDispatchQueue, semaphore: loanSemaphore, group: bankerGroup, customer: customer, banker: LoanBanker())
            }
        }
        bankerGroup.wait()
    }
    
    private func assign(dispatchQueue: DispatchQueue, semaphore: DispatchSemaphore, group: DispatchGroup, customer: Customer, banker: Banker) {
        dispatchQueue.async(group: group) {
            semaphore.wait()
            banker.task(of: customer)
            bankManager.increaseTotalCustomer()
            semaphore.signal()
        }
    }
    
    private func close() {
        let totalTimeText: String = String(format: "%.2f", bankManager.totalTime)
        let totalCustomer: Int = bankManager.totalCustomer
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTimeText)초입니다.")
    }
}
