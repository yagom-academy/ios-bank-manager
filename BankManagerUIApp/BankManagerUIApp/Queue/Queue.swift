struct Queue<T> {
    private let list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var peek: T? {
        return list.firstNode?.value
    }
    
    func returnList() -> [T] {
        return list.returnList()
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
