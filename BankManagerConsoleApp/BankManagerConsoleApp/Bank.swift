import Foundation

struct Bank {
    let numberOfBankManager: Int
    let numberOfCustomer: Int
    let customerQueue: Queue = Queue<Customer>()
    let bankManager: BankManager = BankManager()
    
    init(numberOfBankManager: Int, numberOfCustomer: Int) {
        self.numberOfBankManager = numberOfBankManager
        self.numberOfCustomer = numberOfCustomer
    }
}
