import Foundation

struct Bank {
    private var queue: Queue<Customer>
    
    init() {
        queue = Queue<Customer>()
    }
    
    func open() {
        let customerCount = Int.random(in: 1...10)
        
        (1...customerCount).forEach {
            let customer = Customer(customerNumber: $0)
            queue.enqueue(customer)
        }
    }
}
