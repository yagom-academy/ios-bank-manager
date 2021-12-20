import Foundation

struct CustomerQueue<Element> {
    var customers: LinkedList<Element> = LinkedList<Element>(value: nil)
    var isEmpty: Bool {
        return customers.isEmpty
    }
    
    func enqueue(value: Element) {
        customers.append(value: value)
    }
    
    func dequeue() -> Element? {
        return customers.removeFirst()
    }
    
    func clear() {
        customers.removeAll()
    }
    
    func peek() -> Element? {
        if isEmpty {
            return nil
        } else {
            return customers.head?.value
        }
    }
}
