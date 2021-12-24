import Foundation

struct Bank {
    private struct Banker {
        var customer: Customer?
        
        init() {}
    }
    
    private var banker: Banker
    private var queue: Queue<Customer>
    
    init() {
        queue = Queue<Customer>()
        banker = Banker()
    }
    
    func open() {
        let customerCount = Int.random(in: 1...10)
        
        (1...customerCount).forEach {
            let customer = Customer(customerNumber: $0)
            queue.enqueue(customer)
        }
    }
    
    private func assign(customer: Customer, to banker: inout Banker) {
        banker.customer = customer
    }
}
