import Foundation

struct Bank {
    private struct Banker {
        var customer: Customer? {
            didSet {
                task()
            }
        }
        
        init() {}
        
        private func task() {
            guard let customer = customer else {
                return
            }

            print("\(customer.customerNumber)번 고객 업무 시작")
            // time 7초
            print("\(customer.customerNumber)번 고객 업무 완료")
        }
    }
    
    private var banker: Banker
    private var queue: Queue<Customer>
    
    init() {
        queue = Queue<Customer>()
        banker = Banker()
    }
    
    mutating func open() {
        let customerCount = Int.random(in: 1...10)
        
        (1...customerCount).forEach {
            let customer = Customer(customerNumber: $0)
            queue.enqueue(customer)
        }
        
        while let customer = queue.dequeue() {
            assign(customer: customer, to: &banker)
        }
        
    }
    
    private func assign(customer: Customer, to banker: inout Banker) {
        banker.customer = customer
    }
}
