import Foundation

struct BankManager {
    private enum BankStatus: String {
        case open = "1"
        case close = "2"
    }
    
    func addCustomerQueue(lastCustomer number: Int) -> Queue<Customer> {
        let customerQueue = Queue<Customer>()
        let numberOfCustomer = number + 10

        (number..<numberOfCustomer).forEach {
            let customer = Customer($0 + 1)
            customerQueue.enqueue(customer)
        }

        return customerQueue
    }
    
     func createCustomerQueue() -> Queue<Customer> {
        let customerQueue = Queue<Customer>()
        let numberOfCustomer = Int.random(in: 10...30)
        
        (0..<numberOfCustomer).forEach {
            let customer = Customer($0 + 1)
            customerQueue.enqueue(customer)
        }
        
        return customerQueue
    }

    private func hireBanker(deposit: Int, loan: Int) {
        DepositBanker.number = deposit
        LoanBanker.number = loan
    }
    
    func manageBank(customers: Queue<Customer>) {
        let bank = Bank()
        var customerNumber: Double = 0
        
        hireBanker(deposit: 2, loan: 1)
        
        let processTime = processTime {
            customerNumber = bank.startBanking(customer: customers)
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
