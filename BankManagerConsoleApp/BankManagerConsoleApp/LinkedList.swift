final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var index = 0

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
            index += 1
            return
        }

        let node = Node(data: data)
        tail?.next = node
        node.previous = tail
        tail = node
        index += 1
    }

    func remove() -> T? {
        guard isNotEmpty else { return nil }
        
        let current = head?.next
        let data = head?.data
        head = current
        index -= 1
        return data
    }

    func removeAt(index: Int) -> T? {
        guard isNotEmpty else { return nil }
        guard index >= self.index else {
            let indexNode = searchNode(index: index)
            indexNode?.previous?.next = indexNode?.next
            indexNode?.next?.previous = indexNode?.previous
            return indexNode?.data
        }
        guard index != self.index else {
            let data = tail?.data
            tail?.previous?.next = nil
            tail = tail?.previous
            return data
        }
        return nil
    }

    func removeAll() {
        head = nil
        tail = nil
    }

    func insert(data: T, index: Int) {
        var previousNode: Node<T>?
        var indexNode: Node<T>?
        let newNode = Node<T>(data: data)

        if index > self.index || isEmpty {
            append(data: data)
            return
        } else if index == self.index {
            previousNode = tail?.previous
            indexNode = Node<T>(data: data)
            previousNode?.next = indexNode
            indexNode?.next = tail
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

        self.index += 1
    }

    func searchNode(index: Int) -> Node<T>? {
        var indexNode = head

        for _ in 0..<index {
            indexNode = indexNode?.next
        }
        return indexNode
    }
}
