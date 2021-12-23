import Foundation

struct Bank {
    var queue: Queue<Customer>
    var bankName: String
    
    init(bankName: String) {
        queue = Queue<Customer>()
        self.bankName = bankName
    }
}
