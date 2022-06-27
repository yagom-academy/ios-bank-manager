final class CustomerQueue<T> {
    private var linkedList = LinkedList<T>()

    func enqueue(data: T) {
        linkedList.append(data: data)
    }

    func dequeue() -> T? {
        return linkedList.remove()
    }

    func clear() {
        linkedList.removeAll()
    }

    func peek() -> T? {
        return linkedList.peek()
    }

    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
}
