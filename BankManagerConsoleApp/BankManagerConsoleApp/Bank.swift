import Foundation

struct Bank {
    // MARK: - Properties
    private var customers: CustomerQueue = CustomerQueue<Customer>()
    private var numberOfCustomer: Int = 0
    private let numberOfBankManagerForDeposit: Int
    private let numberOfBankManagerForLoan: Int
    private let dispatchGroup = DispatchGroup()
    private var depositSemaphore: DispatchSemaphore
    private var loanSemaphore: DispatchSemaphore
    
    // MARK: - Initalizer
    init(numberOfBankClerkForDeposit: Int, numberOfBankClerkForLoan:Int, numberOfCustomer: Int) {
        self.numberOfBankManagerForDeposit = numberOfBankClerkForDeposit
        self.numberOfBankManagerForLoan = numberOfBankClerkForLoan
        depositSemaphore = DispatchSemaphore(value: numberOfBankClerkForDeposit)
        loanSemaphore = DispatchSemaphore(value: numberOfBankClerkForLoan)
        
        self.numberOfCustomer = numberOfCustomer
        setupCustomers(of: numberOfCustomer)
    }
    
    // MARK: - Methods
    private func setupCustomers(of number: Int) {
        for index in 0..<number {
            guard let randomTask: BankTask = BankTask.allCases.randomElement() else { return }
            let customer = Customer(number: (index + 1), bankTask: randomTask)
            customers.enqueue(value: customer)
        }
    }
    
    func openBank() {
        let totalTime = checkTotalTime(of: handleTaskOfAllCustomers)
        notifyBankClosing(with: totalTime)
    }
    
    private func checkTotalTime(of taskFunction: () throws -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        do {
            try taskFunction()
        } catch {
            print(error)
        }

        dispatchGroup.wait()
        
        let totalTime = CFAbsoluteTimeGetCurrent() - startTime
        let totalTimeText: String = totalTime.formattedToTwoDecimalPoint
        
        return totalTimeText
    }
    
    private func handleTaskOfAllCustomers() throws {
        while let nextTurnCustomer = try customers.dequeue() {
            DispatchQueue.global().async(group: dispatchGroup) {
                switch nextTurnCustomer.bankTask {
                case .deposit:
                   depositSemaphore.wait()
                   workOnTask(of: nextTurnCustomer)
                case .loan:
                   loanSemaphore.wait()
                   workOnTask(of: nextTurnCustomer)
                }
            }
        }
    }
    
    private func workOnTask(of customer: Customer) {
        notifyStartingTask(of: customer)
        Thread.sleep(forTimeInterval: customer.bankTask.taskHandlingTime)
        notifyFinisingTask(of: customer)
        
        switch customer.bankTask {
        case .deposit:
            depositSemaphore.signal()
        case .loan:
            loanSemaphore.signal()
        }
    }
    
    private func notifyStartingTask(of customer: Customer) {
        print("\(customer.number)번 고객 \(customer.bankTask.description)업무 시작")
    }
    
    private func notifyFinisingTask(of customer: Customer) {
        print("\(customer.number)번 고객 \(customer.bankTask.description)업무 완료")
    }
    
    private func notifyBankClosing(with totalTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalTime)초 입니다.")
    }
}
