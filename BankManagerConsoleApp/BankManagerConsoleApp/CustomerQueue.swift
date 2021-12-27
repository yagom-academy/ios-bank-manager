import Foundation

struct CustomerQueue<Element> {
    // MARK: - Properties
    var customers = LinkedList<Element>()
    
    var isEmpty: Bool {
        return customers.isEmpty
    }
    var peek: Element? {
        return customers.returnHead()
    }
    
    // MARK: - Methods
    func enqueue(value: Element) {
        customers.append(value: value)
    }
    
    @discardableResult
    func dequeue() throws -> Element? {
        let headIndex = 0
        return try customers.remove(at: headIndex)
    }
    
    func clear() {
        customers.removeAll()
    }
}
