final class Queue<T> {
    private let list = LinkedList<T>()
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    func peek() throws -> T {
        return try list.firstNode().value
    }
    
    public func enqueue(_ element: T) {
        list.append(element)
    }
    
    public func dequeue() throws -> T {
        return try list.removeHead().value
    }
    
    public func clear() {
        list.removeAll()
    }
}
