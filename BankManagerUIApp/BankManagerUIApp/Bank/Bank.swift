import Foundation

struct Bank {
    private let bankingGroup = DispatchGroup()
    private var depositSemaphore: DispatchSemaphore
    private var loanSemaphore: DispatchSemaphore
    
    init(depositNumber: Int, loanNumber: Int) {
        self.depositSemaphore = DispatchSemaphore(value: depositNumber)
        self.loanSemaphore = DispatchSemaphore(value: loanNumber)
    }
    
    func startBanking(customers: Queue<Customer>, bankers: [Banking: BankerLogic]) -> Int {
        var customerNumber = 0
        
        guard let depositBanker = bankers[Banking.deposit], let loanBanker = bankers[Banking.loan] else { return 0 }
        
        while customers.isEmpty == false {
            guard let customer = customers.dequeue() else { return 0 }
            
            switch customer.banking {
            case .loan:
                processWork(banker: loanBanker, customer: customer, semaphore: loanSemaphore)
            case .deposit:
                processWork(banker: depositBanker, customer: customer, semaphore: depositSemaphore)
            }
        
            customerNumber += 1
        }
        
        return customerNumber
    }
    
    private func processWork(banker: BankerLogic, customer: Customer, semaphore: DispatchSemaphore) {
        let serveWork = DispatchWorkItem {
            semaphore.wait()
            banker.serve(customer: customer)
            semaphore.signal()
        }

        DispatchQueue.global().async(group: bankingGroup, execute: serveWork)
    }
}
