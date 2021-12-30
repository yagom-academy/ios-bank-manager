import Foundation

struct Client {
    let waitingNumber: Int
    let bankTask: BankTask
    
    init(waitingNumber: Int, bankTask: BankTask) {
        self.waitingNumber = waitingNumber
        self.bankTask = bankTask
    }
}
