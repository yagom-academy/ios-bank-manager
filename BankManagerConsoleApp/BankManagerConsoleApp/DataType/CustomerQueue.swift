final class CustomerQueue<T> {
    private var linkedList: LinkedList<T>

    init(linkedList: LinkedList<T>) {
        self.linkedList = linkedList
    }

    var count: Int {
        linkedList.count
    }

    var isEmpty: Bool {
        linkedList.isEmpty
    }

    func peek() throws -> T {
        guard let data = linkedList.peek else {
            throw QueueError.notExistingData
        }
        return data
    }

    func enqueue(data: T) {
        linkedList.append(data: data)
    }

    func dequeue() throws -> T {
        guard let data = linkedList.removeAt() else {
            throw QueueError.notExistingData
        }
        return data
    }

    func clear() {
        linkedList.removeAll()
    }
}
