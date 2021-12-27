import Foundation

struct Customer {
    let waitingNumber: Int
    let task: BankTask?
    
    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.task = BankTask.allCases.randomElement()
    }
}
