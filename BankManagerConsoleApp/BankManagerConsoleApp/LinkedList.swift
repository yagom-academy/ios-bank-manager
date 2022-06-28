final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var index = 0

    var isEmpty: Bool {
        head == nil
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
        let current = head?.next
        let data = head?.data
        head = current
        index -= 1
        return data
    }

    func removeAll() {
        head = nil
        tail = nil
    }

    func insert(data: T, index: Int) {
        var count = 0
        var previousNode = head
        var indexNode = head
        let newNode = Node<T>(data: data)
        
        if index == self.index {
            previousNode = tail?.previous
            indexNode = Node<T>(data: data)
            previousNode?.next = indexNode
            indexNode?.next = tail
        } else if index > self.index{
            append(data: data)
        } else if index == 0 {
            head?.previous = newNode
            newNode.next = head
            head = newNode
        } else {
            while count < index {
                indexNode = indexNode?.next
                previousNode = indexNode?.previous
                previousNode?.next = indexNode
                count += 1
            }
            
            previousNode?.next = newNode
            newNode.previous = previousNode
            newNode.next = indexNode
            indexNode?.previous = newNode
        }
        
        self.index += 1
    }
}
