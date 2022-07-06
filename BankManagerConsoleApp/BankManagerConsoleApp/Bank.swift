import Foundation

struct Bank {
    let depositSemaphore = DispatchSemaphore(value: 2)
    let loanSemaphore = DispatchSemaphore(value: 1)
    
    func startBanking(customer: Queue<Customer>, bankers: [BankerLogic]) -> Double {
        var customerNumber: Double = 0
        let bankingGroup = DispatchGroup()
        
        while customer.isEmpty == false {
            guard let customer = customer.dequeue() else { return 0 }
            
            switch customer.banking {
            case .loan:
                processLoan(bankers: bankers, customer: customer, group: bankingGroup)
            case .deposit:
                processDeposit(bankers: bankers, customer: customer, group: bankingGroup)
            }
            
            customerNumber += 1
        }
        
        bankingGroup.wait()
        
        return customerNumber
    }
    
    func processLoan(bankers: [BankerLogic], customer: Customer, group: DispatchGroup) {
        let loanWork = DispatchWorkItem {
            loanSemaphore.wait()
            bankers[2].serve(customer: customer)
            loanSemaphore.signal()
        }
        DispatchQueue.global().async(group: group, execute: loanWork)
    }
    
    func processDeposit(bankers: [BankerLogic], customer: Customer, group: DispatchGroup) {
        let depositWork = DispatchWorkItem {
            depositSemaphore.wait()
            bankers[0].serve(customer: customer)
            depositSemaphore.signal()
        }
        DispatchQueue.global().async(group: group, execute: depositWork)
    }
}
