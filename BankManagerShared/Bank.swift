import Foundation

protocol BankDelegate {
    func checkTime()
    func checkCustomer()
}

class Bank {    
    private var bankers: [Banker]
    private var queue: Queue<Customer>
    private var totalTime: TimeInterval
    private var totalCustomer: Int
   
    init(bankers: [Banker]) {
        self.queue = Queue<Customer>()
        self.bankers = bankers
        self.totalTime = .zero
        self.totalCustomer = .zero
    }
    
    convenience init(banker: Banker) {
        self.init(bankers: [banker])
    }
    
    convenience init() {
        let banker = Banker()
        self.init(banker: banker)
    }
}

// MARK: - method

extension Bank {
    func run() {
        let range = 10...30
        let customerCount = Int.random(in: range)
        
        (1...customerCount).forEach {
            let customer = Customer(customerNumber: $0)
            queue.enqueue(customer)
        }
        
        while let customer = queue.dequeue() {
            assign(customer: customer, to: &banker)
        }
        
        close()
    }
    
    private func close() {
        let totalTimeText: String = String(format: "%.2f", totalTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTimeText)초입니다.")
    }
    
    private func assign(customer: Customer, to banker: inout Banker) {
        banker.customer = customer
    }
}

// MARK: - BankDelegate

extension Bank: BankDelegate {
    func checkCustomer() {
        let customerCountAtOnce = 1
        totalCustomer += customerCountAtOnce
    }
    
    func checkTime() {
        let secondsAtOnce: TimeInterval = 0.7
        totalTime += secondsAtOnce
    }
}
