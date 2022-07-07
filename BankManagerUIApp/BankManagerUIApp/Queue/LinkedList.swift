final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

    
    var isEmpty: Bool {
        return head == nil
    }

    var firstNode: Node<T>? {
        return head
    }
    
    func returnList() -> [T] {
        var list: [T] = []
        var node: Node<T>? = head
        while node != tail {
            guard let currentNode = node else {
                return []
            }
            
            list.append(currentNode.value)
            node = currentNode.next
        }
        
        if let node = node {
            list.append(node.value)
        }
        print(list)
        return list
    }

    func append(_ value: T) {
        let newNode = Node<T>(value)

        if let tailNode = tail {
            tail = newNode
            tailNode.next = tail
        } else {
            head = newNode
            tail = newNode
        }
    }

    func removeHead() -> Node<T>? {
        guard let node = head else {
            return nil
        }
        
        if let next = head?.next {
            head = next
        } else {
            head = nil
            tail = nil
        }
        return node
    }

    func removeAll() {
        while head?.next == tail {
            let next = head?.next
            head = nil
            head = next
        }
        head = nil
        tail = nil
    }
}
