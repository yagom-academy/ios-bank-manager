import Foundation

struct Queue<Element> {
    private let items: LinkedList<Element>
    
    init(items: LinkedList<Element> = LinkedList<Element>()) {
        self.items = items
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var peek: Element? {
        return items.first
    }
    
    func enqueue(_ item: Element) {
        items.append(item)
    }
    
    @discardableResult
    func dequeue() -> Element? {
        return items.removeFirst()
    }
    
    func clear() {
        items.removeAll()
    }
}
