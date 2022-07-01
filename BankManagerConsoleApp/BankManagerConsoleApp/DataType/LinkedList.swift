final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

    private(set) var count = 0 {
        didSet {
            if count == 0 {
                head = nil
                tail = nil
            }
        }
    }

    var isEmpty: Bool {
        head == nil
    }

    var isNotEmpty: Bool {
        head != nil
    }

    var peek: T? {
        head?.data
    }

    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }

    func append(data: T) {
        if head == nil {
            head = Node(data: data)
            tail = head
            count += 1
            return
        }

        let node = Node(data: data)
        tail?.next = node
        node.previous = tail
        tail = node
        count += 1
    }

    func removeAt(index: Int = 0) -> T? {
        guard isNotEmpty, index >= 0 else { return nil }

        if index == 0 {
            let current = head?.next
            let data = head?.data
            head = current
            count -= 1
            return data
        } else if index < count - 1 {
            let indexNode = searchNode(index: index)
            indexNode?.previous?.next = indexNode?.next
            indexNode?.next?.previous = indexNode?.previous
            count -= 1
            return indexNode?.data
        } else if index == count - 1 {
           let data = tail?.data
           tail?.previous?.next = nil
           tail = tail?.previous
           count -= 1
           return data
        }

        return nil
    }

    func removeAll() {
        count = 0
    }

    func insert(data: T, index: Int) {
        var previousNode: Node<T>?
        var indexNode: Node<T>?
        let newNode = Node<T>(data: data)

        if index >= count || isEmpty {
            append(data: data)
            return
        } else if index == 0 {
            head?.previous = newNode
            newNode.next = head
            head = newNode
        } else {
            indexNode = searchNode(index: index)
            previousNode = indexNode?.previous
            previousNode?.next = newNode
            newNode.previous = previousNode
            newNode.next = indexNode
            indexNode?.previous = newNode
        }

       count += 1
    }

    private func searchNode(index: Int) -> Node<T>? {
        var indexNode = head

        for _ in 0..<index {
            indexNode = indexNode?.next
        }
        return indexNode
    }
}
