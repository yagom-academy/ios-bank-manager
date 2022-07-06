import Foundation

struct Bank {
    let depositSemaphore = DispatchSemaphore(value: 2)
    let loanSemaphore = DispatchSemaphore(value: 1)
    
    func startBanking(customer: Queue<Customer>, bankers: [BankerLogic]) -> Double {
        var customerNumber: Double = 0
        
        while customer.isEmpty == false {
            guard let customer = customer.dequeue() else { return 0 }
            
            switch customer.banking {
            case .loan:
                loan(bankers: bankers, customer: customer)
            case .deposit:
                deposit(bankers: bankers, customer: customer)
            }
            
            customerNumber += 1
        }
        
        return customerNumber
    }
    
    func loan(bankers: [BankerLogic], customer: Customer) {
        DispatchQueue.global().async {
            loanSemaphore.wait()
            bankers[2].serve(customer: customer)
            loanSemaphore.signal()
        }
    }
    
    func deposit(bankers: [BankerLogic], customer: Customer) {
        DispatchQueue.global().async {
            depositSemaphore.wait()
            bankers[0].serve(customer: customer)
            depositSemaphore.signal()
        }
    }
}
