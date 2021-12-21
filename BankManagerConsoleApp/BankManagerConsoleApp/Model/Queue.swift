import Foundation

struct Queue<Element> {
    private var items: LinkedList<Element>
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    init() {
        self.items = LinkedList()
    }
    
    mutating func enqueue(_ data: Element) {
        items.append(data)
    }
    
    mutating func dequeue() -> Element? {
        return items.removeFirst()
    }
    
    func peek() -> Element? {
        return items.first
    }
    
    mutating func clear() {
        items.removeAll()
    }
}
