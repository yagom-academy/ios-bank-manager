import Foundation

struct CustomerQueue<Element> {
    var customers = LinkedList<Element>()
    
    var isEmpty: Bool {
        return customers.isEmpty
    }
    var peek: Element? {
        return customers.head?.value
    }
    
    func enqueue(value: Element) {
        customers.append(value: value)
    }
    
    func dequeue() throws -> Element? {
        let headIndex = 0
        return try customers.remove(at: headIndex)
    }
    
    func clear() {
        customers.removeAll()
    }
}
