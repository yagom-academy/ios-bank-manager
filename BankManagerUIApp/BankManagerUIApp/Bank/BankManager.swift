import Foundation

struct BankManager {
    private enum BankStatus: String {
        case open = "1"
        case close = "2"
    }
    lazy var bank = Bank()
    
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
    
    mutating func manageBank(customers: Queue<Customer>) -> Int {
        hireBanker(deposit: 2, loan: 1)
        
//        let processTime = processTime {
//            customerNumber = bank.startBanking(customer: customers)
//        }
        
        let customerNumber = bank.startBanking(customer: customers)

        return customerNumber
    }
    
    private func processTime(processFunction: () -> Void) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        processFunction()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return processTime
    }
}
