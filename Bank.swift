import Foundation

protocol BankDelegate {
    func checkTime()
    func checkCustomer()
}

class Bank {
    private struct Banker {
        var delegate: BankDelegate?
        var customer: Customer? {
            didSet {
                task()
            }
        }
        
        init() {}
        
        private func task() {
            do {
                try taskWithError()
            } catch {
                print(error.localizedDescription)
            }
        }
        
        private func taskWithError() throws {
            guard let customer = customer else {
                throw CustomerError.notExistCustomer
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
        totalCustomer += 1
    }
    
    func checkTime() {
        totalTime += 0.7
    }
}
