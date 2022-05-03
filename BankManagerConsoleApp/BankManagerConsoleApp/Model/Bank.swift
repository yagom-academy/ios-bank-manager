import Foundation

struct Bank {
    private var numberOfCustomer: Int
    private let customerQueue: Queue = Queue<Customer>()
    private let teller: Teller = Teller()
    private let depositWindow: DispatchSemaphore = DispatchSemaphore(value: 2)
    private let loanWindow: DispatchSemaphore = DispatchSemaphore(value: 1)
    private let bankingGroup = DispatchGroup()
    
    init(_ numberOfCustomer: Int) {
        self.numberOfCustomer = numberOfCustomer
    }
    
    mutating func setUpCustomer(number: Int) {
        self.numberOfCustomer = number
        addCustomerInLine()
    }
    
    private func addCustomerInLine() {
        for number in 1...numberOfCustomer {
            customerQueue.enqueue(Customer(number))
        }
    }
    
    func work() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            makeTellerWorkByTask(for: customer)
        }
        
        bankingGroup.wait()
        let endTime = CFAbsoluteTimeGetCurrent()
        closeBanking(from: startTime, to: endTime)
    }
    
    private func makeTellerWorkByTask(for customer: Customer) {
        guard let task = customer.taskType else {
            return
        }
        
        switch task {
        case .deposit:
            depositWindow.wait()
            DispatchQueue.global().async(group: bankingGroup) {
                teller.work(for: customer)
                depositWindow.signal()
            }
        case .loan:
            loanWindow.wait()
            DispatchQueue.global().async(group: bankingGroup) {
                teller.work(for: customer)
                loanWindow.signal()
            }
        }
    }
    
    private func closeBanking(from startTime: CFAbsoluteTime, to endTime: CFAbsoluteTime) {
        let totalWorkTime = String(format: "%.2f", endTime - startTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
