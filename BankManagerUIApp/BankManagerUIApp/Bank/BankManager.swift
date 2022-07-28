import Foundation

struct BankManager {
    private enum BankStatus: String {
        case open = "1"
        case close = "2"
    }
    
    let bank = Bank(depositNumber: 2, loanNumber: 1)
    
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

    private func setUpBanker() -> [Banking: BankerLogic] {
        let depositBanker = DepositBanker()
        let loanBanker = LoanBanker()
        let bankers: [Banking: BankerLogic] = [Banking.deposit: depositBanker, Banking.loan: loanBanker]

        return bankers
    }
    
    func manageBank(customers: Queue<Customer>) -> Int {
        let customerNumber = bank.startBanking(customers: customers,
                                               bankers: setUpBanker())
        return customerNumber
    }
}
