class CustomerQueue<T> {
    var linkedList: LinkedList<T>?
    
    func enqueue(data: T) {
        linkedList?.append(data: data)
    }
    
    func dequeue() -> T? {
        return linkedList?.remove()
    }
    
    func clear() {
        linkedList?.removeAll()
    }
    
    func peek() -> T? {
        return linkedList?.peek()
    }
}
