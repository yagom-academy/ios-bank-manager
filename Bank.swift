import Foundation

protocol BankDelegate {
    mutating func checkTime()
    mutating func checkCustomer()
}

struct Bank {
    private struct Banker {
        var delegate: BankDelegate?
        var customer: Customer? {
            didSet {
                task()
            }
        }
        
        init() {}
        
        private mutating func task() {
            guard let customer = customer else {
                return
            }

            print("\(customer.customerNumber)번 고객 업무 시작")
            delegate?.checkTime()
            print("\(customer.customerNumber)번 고객 업무 완료")
            delegate?.checkCustomer()
        }
    }
    
    private var banker: Banker
    private var queue: Queue<Customer>
    private var totalTime: TimeInterval
    private var totalCustomer: Int
    
    init() {
        queue = Queue<Customer>()
        banker = Banker()
        totalTime = 0
        totalCustomer = 0
        banker.delegate = self
    }
    
    mutating func run() {
        let customerCount = Int.random(in: 1...10)
        
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
        
    }
    
    private func assign(customer: Customer, to banker: inout Banker) {
        banker.customer = customer
    }
}

extension Bank: BankDelegate {
    mutating func checkCustomer() {
        totalCustomer += 1
    }
    
    mutating func checkTime() {
        totalTime += 0.7
    }
}
