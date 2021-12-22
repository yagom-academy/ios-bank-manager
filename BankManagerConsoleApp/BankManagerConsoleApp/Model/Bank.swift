import Foundation

struct Bank {
    var waitingLine = Queue<Customer>()
    
    mutating func setWaitingLine(with numberOfCustomer: () -> Int) {
        let totalNumber = numberOfCustomer()
        for _ in 1...totalNumber {
            waitingLine.enqueue(Customer())
        }
    }
    
}
