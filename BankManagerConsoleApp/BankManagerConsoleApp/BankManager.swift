import Foundation

struct BankManager {
    private enum BankStatus: String {
        case open = "1"
        case close = "2"
    }
    
    func openUpBank() {
        print("1 : 은행개점 \n2 : 종료\n입력 :", terminator: " ")
        
        guard let status = readLine() else { return }
        
        guard let bankStatus = BankStatus(rawValue: status) else {
            print("입력이 잘못되었습니다.")
            openUpBank()
            return
        }
        
        selectWork(bankStatus)
    }

    private func selectWork(_ status: BankStatus) {
        switch status {
        case .open:
            manageBank()
            openUpBank()
        case .close:
            print("업무를 종료합니다.")
            return
        }
    }
    
    private func createCustomerQueue() -> Queue<Customer> {
        let customerQueue = Queue<Customer>()
        let numberOfCustomer = Int.random(in: 10...30)
        
        (0..<numberOfCustomer).forEach {
            let customer = Customer($0 + 1)
            customerQueue.enqueue(customer)
        }
        
        return customerQueue
    }

    private func createBanker(deposit: Int, loan: Int) -> [BankerLogic] {
        let depositBankers: [BankerLogic] = Array(repeating: DepositBanker(), count: deposit)
        let loanBankers: [BankerLogic] = Array(repeating: LoanBanker(), count: loan)
        let bankers = depositBankers + loanBankers
        
        return bankers
    }
    
    private func manageBank() {
        let bank = Bank()
        var customerNumber: Double = 0
        
        let processTime = processTime {
            customerNumber = bank.startBanking(customer: createCustomerQueue(),
                                               bankers: createBanker(deposit: 2, loan: 1))
        }
        
        let workingTime = String(format: "%.2f", processTime)
    
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(Int(customerNumber))명이며, 총 업무시간은 \(workingTime)초입니다.")
    }
    
    private func processTime(processFunction: () -> Void) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        processFunction()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return processTime
    }
}
