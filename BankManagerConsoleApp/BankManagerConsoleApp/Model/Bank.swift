import Foundation

struct Bank {
    var waitingLine = Queue<Customer>()
    var bankClerk = BankClerk()
    
    mutating func setWaitingLine(with numberOfCustomer: () -> Int) {
        let totalNumber = numberOfCustomer()
        for number in 1...totalNumber {
            waitingLine.enqueue(Customer(waitingNumber: number))
        }
    }
    
    mutating func letClerkWork() {
        while waitingLine.isEmpty == false {
            bankClerk.work(&waitingLine)
        }
    }
}
