class Queue<T> {
    private var head: Node<T>?
    private weak var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    var allValues: [T] {
        var result = [T]()
        var node = head
        while let value = node?.value {
            result.append(value)
            node = node?.next
        }
        return result
    }
    
    func enqueue(_ value: T) {
        let node = Node(value)
        if isEmpty {
            head = node
        } else {
            tail?.next = node
        }
        tail = node
    }

    func dequeue() -> T? {
        let value = head?.value
        head = head?.next
        return value
    }
    
    func clear() {
        head = nil
    }
    
    func peek() -> T? {
        return head?.value
    }
}

extension Queue {
    private class Node<S> {
        var value: S
        var next: Node?
        
        init(_ value: S) {
            self.value = value
        }
    }
}
