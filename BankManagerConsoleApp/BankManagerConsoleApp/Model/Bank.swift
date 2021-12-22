import Foundation

struct Bank {
    private var waitingLine = Queue<Customer>()
    private var bankClerk = BankClerk()
    
    mutating func setWaitingLine(with numberOfCustomer: () -> Int) {
        let totalNumber = numberOfCustomer()
        for number in 1...totalNumber {
            waitingLine.enqueue(Customer(waitingNumber: number))
        }
    }
    
    private mutating func dequeueWaitingLine() -> Customer {
        guard let customer = waitingLine.dequeue() else {
            fatalError("unknown error")
        }
        
        return customer
    }

    
    mutating func letClerkWork() {
        while waitingLine.isEmpty == false {
            let customer = dequeueWaitingLine()
            bankClerk.handleTask(of: customer)
        }
    }
}
