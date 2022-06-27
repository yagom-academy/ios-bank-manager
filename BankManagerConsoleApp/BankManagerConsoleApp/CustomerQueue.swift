final class CustomerQueue<T> {
    private var linkedList = LinkedList<T>()

    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var peek: T? {
        return linkedList.peek
    }
    
    func enqueue(data: T) {
        linkedList.append(data: data)
    }

    func dequeue() -> T? {
        return linkedList.remove()
    }

    func clear() {
        linkedList.removeAll()
    }
}
