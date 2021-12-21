import Foundation

struct Queue<T> {
    private var items: LinkedList<T>
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    init() {
        items = LinkedList<T>.init()
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        return items.remove()
    }
    
    mutating func clear() {
        items = LinkedList<T>.init()
    }
    
    func peek() -> T? {
        return items.peek()
    }
}
