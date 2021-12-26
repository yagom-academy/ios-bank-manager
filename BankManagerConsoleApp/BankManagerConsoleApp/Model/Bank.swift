import Foundation

final class Bank {
    private let bankClerk: BankClerk
    private var customerQueue = Queue<Customer>()
    var delegate: BankDelegate?
    
    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
    }
    
    func handOutWaitingNumber(from customerNumber: Int) {
        for number in 1...customerNumber {
            let customer = Customer(waitingNumber: number)
            customerQueue.enqueue(customer)
        }
    }
    
    private func respondToCustomer() {
        guard let customer = customerQueue.dequeue() else {
            return
        }
        bankClerk.work(for: customer)
    }
    
    func openBank() {
        var numberOfCustomers = 0
        let openTime = CFAbsoluteTimeGetCurrent()
        while customerQueue.isEmpty == false {
            respondToCustomer()
            numberOfCustomers += 1
        }
        closeBank(numberOfCustomers, from: openTime)
    }
    
    private func closeBank(_ numberOfCustomers: Int, from openTime: CFAbsoluteTime) {
        let durationTime = CFAbsoluteTimeGetCurrent() - openTime
        delegate?.bank(didFinish: numberOfCustomers, durationTime: durationTime.roundedOffDescription(for: 2))
    }

}
