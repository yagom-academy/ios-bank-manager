import Foundation

protocol BankDelegate {
    func bank(DidEnqueueCustomer customer: Customer)
}

final class Bank {
    private var loanCustomerQueue = Queue<Customer>()
    private var depositCustomerQueue = Queue<Customer>()
    private let loanBankersCount: Int
    private let depositBankersCount: Int
    private var numberOfCustomers = 0
    var delegate: BankDelegate?
    
    init(loanBankersCount: Int = 1, depositBankersCount: Int = 2) {
        self.loanBankersCount = loanBankersCount
        self.depositBankersCount = depositBankersCount
    }
    
    func handOutWaitingNumber(from customerCount: Int) {
        let maxCount = numberOfCustomers + customerCount
        let waitingNumbers = numberOfCustomers..<maxCount
        for number in waitingNumbers {
            let customer = Customer(waitingNumber: number)
            customerQueue(customer.banking).enqueue(customer)
            delegate?.bank(DidEnqueueCustomer: customer)
        }
        numberOfCustomers = maxCount
    }
    
    private func customerQueue(_ banking: Banking) -> Queue<Customer> {
        switch banking {
        case .loan:
            return loanCustomerQueue
        case .deposit:
            return depositCustomerQueue
        }
    }
    
    func openBank() {
        let bankGroup = DispatchGroup()
        
        workBankers(loanBankersCount, customers: loanCustomerQueue, group: bankGroup)
        workBankers(depositBankersCount, customers: depositCustomerQueue, group: bankGroup)
        
        bankGroup.wait()
    }
    
    private func workBankers(_ number: Int, customers: Queue<Customer>, group: DispatchGroup) {
        for _ in 1...number {
            workBanker(customers: customers, group: group)
        }
    }
    
    private func workBanker(customers: Queue<Customer>, group: DispatchGroup) {
        let banker = Banker()
        DispatchQueue.global().async(group: group) {
            while let customer = customers.dequeue() {
                banker.work(for: customer)
            }
        }
    }
    
    func close() {
        self.numberOfCustomers = 0
    }
}
