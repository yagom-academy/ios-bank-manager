import Foundation

struct Bank {
    private let bankingGroup = DispatchGroup()
    
    func startBanking(customer: Queue<Customer>, bankers: [Banking: BankerLogic]) -> Double {
        var customerNumber: Double = 0
        
        guard let depositBanker = bankers[Banking.deposit], let loanBanker = bankers[Banking.loan] else {return 0 }
        
        let depositSemaphore = DispatchSemaphore(value: depositBanker.number)
        let loanSemaphore = DispatchSemaphore(value: loanBanker.number)
        
        while customer.isEmpty == false {
            guard let customer = customer.dequeue() else { return 0 }
            
            switch customer.banking {
            case .loan:
                processWork(banker: loanBanker, customer: customer, semaphore: loanSemaphore)
            case .deposit:
                processWork(banker: depositBanker, customer: customer, semaphore: depositSemaphore)
            }
            
            customerNumber += 1
        }
        
        bankingGroup.wait()
        
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
