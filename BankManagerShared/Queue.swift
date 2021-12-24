import Foundation

class Queue<T> {
    private var items: LinkedList<T>
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    init() {
        items = LinkedList<T>()
    }
    
    func enqueue(_ item: T) {
        items.append(item)
    }
    
    func dequeue() -> T? {
        return items.removeFirst()
    }
    
    func clear() {
        items = LinkedList<T>()
    }
    
    func peek() -> T? {
        return items.peek()
    }
}
