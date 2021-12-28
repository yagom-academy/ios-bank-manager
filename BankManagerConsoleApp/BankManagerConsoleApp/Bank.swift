import Foundation

struct Bank {
    // MARK: - Properties
    private var bankManager: DispatchQueue = DispatchQueue(label: "customSerial")
    private var customers: CustomerQueue = CustomerQueue<Customer>()
    private var numberOfCustomer: Int = 0
    private let dispatchGroup = DispatchGroup()
    private let numberOfBankManagerForDeposit: Int
    private let numberOfBankManagerForLoan: Int
    private var depositSemaphore: DispatchSemaphore
    private var loanSemaphore: DispatchSemaphore
    // MARK: - Initalizer
    init(numberOfBankClerkForDeposit: Int, numberOfBankClerkForLoan:Int, numberOfCustomer: Int) {
        self.numberOfCustomer = numberOfCustomer
        self.numberOfBankManagerForDeposit = numberOfBankClerkForDeposit
        self.numberOfBankManagerForLoan = numberOfBankClerkForLoan
        setupSemaphore(deposit: numberOfBankClerkForDeposit, loan: numberOfBankClerkForLoan)
        setupCustomers(of: numberOfCustomer)
        
    }
    
    // MARK: - Methods
    private func setupCustomers(of number: Int) {
         for index in 0..<number {
             let customer = Customer(number: (index + 1), task: BankTask)
             customers.enqueue(value: customer)
         }
     }
    
    private mutating func setupSemaphore(deposit: Int, loan: Int) {
          depositSemaphore = DispatchSemaphore(value: deposit)
          loanSemaphore = DispatchSemaphore(value: loan)
    }
    
    func openBank() {
        let totalTime = checkTotalTime(of: handleTaskOfAllCustomers)
        notifyBankClosing(with: totalTime)
    }
    
    private func checkTotalTime(of taskFunction: () throws -> Void) -> String {
            let startTime = CFAbsoluteTimeGetCurrent()

            dispatchGroup.enter()  // 수정 후
            do {
                try taskFunction()
            } catch {
                print(error)

            }
            dispatchGroup.leave()

            while customers.isEmpty == false {  // 고객 업무가 모두 끝났는지 체크
                continue
            }
            dispatchGroup.wait() // dispatchGroup의 일이 종료됐다고 판단하고 소요시간을 계산

            let totalTime = CFAbsoluteTimeGetCurrent() - startTime

            let totalTimeText: String = totalTime.formattedToTwoDecimalPoint

            return totalTimeText
        }
    
    private func handleTaskOfAllCustomers() throws {
        while let nextTurnCustomer = try customers.dequeue() {
            DispatchQueue.global().async(group: dispatchGroup) { [self] in
                switch nextTurnCustomer.bankTask {
                case .deposit:
                    self.depositSemaphore.wait()
                    self.workOnTask(of: nextTurnCustomer)
                case .loan:
                    self.loanSemaphore.wait()
                    self.workOnTask(of: nextTurnCustomer)
                }
            }
        }
    }

    private func workOnTask(of customer: Customer) {
        notifyStartingTask(of: customer)
        
        Thread.sleep(forTimeInterval: customer.bankTask.taskHandlingTime)
        
        notifyFinisingTask(of: customer)
        
        switch customer.bankTask {
            depositSemaphore.signal()
        case .loan:
            loanSemaphore.signal()
        case .deposit:
            nil
        }
    }
    
    private func notifyStartingTask(of customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
    }
    
    private func notifyFinisingTask(of customer: Customer) {
        print("\(customer.number)번 고객 업무 완료")
    }
    
    private func notifyBankClosing(with totalTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalTime)초 입니다.")
    }
}
