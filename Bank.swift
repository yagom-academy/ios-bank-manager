import Foundation

struct Bank {
    var queue: Queue<Customer>
    
    init() {
        queue = Queue<Customer>()
    }
}
