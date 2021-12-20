import Foundation

struct Queue<T> {
    typealias LinkedList = Array
    
    private var items: LinkedList<T>
    
    init() {
        items = LinkedList<T>.init()
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T {
        items.removeFirst()
    }
    
    mutating func clear() {
        items = LinkedList<T>.init()
    }
}
