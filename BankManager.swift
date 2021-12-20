import Foundation

struct LinkedList<T> {
    class Node {
        var data: T
        var next: Node?
        
        init(data: T, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
    
    var head: Node?
    var tail: Node?
    
    init() {
        self.head = nil
        self.tail = nil
    }
    
}

struct Queue<T> {
    typealias LinkedList = Array
    
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
    
    mutating func dequeue() -> T {
        return items.removeFirst()
    }
    
    mutating func clear() {
        items = LinkedList<T>.init()
    }
    
    func peek() -> T? {
        return items.first
    }
}
