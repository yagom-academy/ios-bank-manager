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
        return items.remove(at: 0)
    }
    
    func peek() -> Element? {
        return items.first
    }
    
    mutating func insert(_ data: Element, at index: Int) {
        items.insert(data, at: index)
    }
    
    mutating func remove(at index: Int) -> Element? {
        return items.remove(at: index)
    }
    
    mutating func clear() {
        items.removeAll()
    }
}
