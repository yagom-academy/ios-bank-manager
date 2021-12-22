import Foundation

struct Bank {
    private let bankClerk: BankClerk
    private var customerQueue = Queue<Customer>()
    
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
        let durationTime = CFAbsoluteTimeGetCurrent() - openTime
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(durationTime)초 입니다.")
    }
}


