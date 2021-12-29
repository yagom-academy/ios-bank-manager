import Foundation

struct Client {
    let waitingNumber: Int
    let bankTask: BankTask
    
    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        let task: BankTask! = BankTask.allCases.randomElement()
        self.bankTask = task
    }
}
