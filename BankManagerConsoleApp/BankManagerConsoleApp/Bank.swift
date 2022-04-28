import Foundation

struct Bank {
    let numberOfBankManager: Int
    let numberOfCustomer: Int
    let customerQueue: Queue = Queue<Customer>()
    let bankManager: BankManager = BankManager()
    
    init(numberOfBankManager: Int, numberOfCustomer: Int) {
        self.numberOfBankManager = numberOfBankManager
        self.numberOfCustomer = numberOfCustomer
        makeCustomerInLine()
    }
    
    private func makeCustomerInLine() {
        for number in 1...numberOfCustomer {
            customerQueue.enqueue(Customer(number: number))
        }
    }
}
