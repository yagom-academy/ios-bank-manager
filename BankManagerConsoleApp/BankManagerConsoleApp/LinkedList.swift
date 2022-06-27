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
            head?.next = tail
        }

        let node = Node(data: data)
        tail?.next = node
        node.next = tail
    }

    func peak() -> T? {
        return head?.data
    }
}
