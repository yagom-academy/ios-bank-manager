final class Queue<T> {
    private let list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var peek: T? {
        return list.firstNode?.value
    }
    
    func enqueue(_ element: T) {
        list.append(element)
    }
    
    func dequeue() -> T? {
        return list.removeHead()?.value
    }
    
    func clear() {
        list.removeAll()
    }
}
