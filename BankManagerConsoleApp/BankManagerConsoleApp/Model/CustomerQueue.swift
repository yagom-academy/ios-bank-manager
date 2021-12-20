struct CustomerQueue<T> {
    var linkedList: LinkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        linkedList.append(element)
    }
    
    mutating func dequeue() -> T? {
        linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    mutating func peek() -> T? {
        return linkedList.first
    }
}
