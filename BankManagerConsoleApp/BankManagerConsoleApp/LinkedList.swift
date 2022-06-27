final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }

    func append(data: T) {
        if head == nil {
            head = Node(data: data)
            tail = head
            return
        }

        let node = Node(data: data)
        tail?.next = node
        tail = node
    }

    func peek() -> T? {
        return head?.data
    }

    func remove() -> T? {
        let current = head?.next
        let data = head?.data
        head = current
        return data
    }

    func removeAll() {
        head = nil
    }
}
