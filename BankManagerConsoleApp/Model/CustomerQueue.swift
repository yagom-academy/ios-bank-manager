import Foundation

struct CustomerQueue<Element> {
    var customers: LinkedList<Element> = LinkedList<Element>(nil)
    var isEmpty: Bool {
        return customers.isEmpty
    }
    var peek: Element? {
        return customers.head?.value
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
}
