import Foundation

struct Bank {
    private var customerQueue: Queue<Customer>
    private let bankManager: BankManager
    private var depositBankerCount: Int
    private var loanBankerCount: Int
    
    init(depositBankerCount: Int, loanBankerCount: Int, customerQueue: Queue<Customer>, bankManager: BankManager) {
        self.depositBankerCount = depositBankerCount
        self.loanBankerCount = loanBankerCount
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
        let bankerGroup = DispatchGroup()
        
        let loanSemaphore = DispatchSemaphore(value: loanBankerCount)
        let depositSemaphore = DispatchSemaphore(value: depositBankerCount)
        
        while let customer = customerQueue.dequeue() {
            switch customer.taskType {
            case .deposit:
                assign(semaphore: depositSemaphore, group: bankerGroup, customer: customer, banker: DepositBanker.self)
            case .loan:
                assign(semaphore: loanSemaphore, group: bankerGroup, customer: customer, banker: LoanBanker.self)
            }
        }
        bankerGroup.wait()
    }
    
    private func assign(semaphore: DispatchSemaphore, group: DispatchGroup, customer: Customer, banker: Banker.Type) {
        DispatchQueue.global().async(group: group) {
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
