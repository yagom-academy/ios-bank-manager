final class Queue<T> {
    private let list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    func peek() throws -> T {
        return try list.firstNode().value
    }
    
    func enqueue(_ element: T) {
        list.append(element)
    }
    
    func dequeue() throws -> T {
        return try list.removeHead().value
    }
    
    func clear() {
        list.removeAll()
    }
}
