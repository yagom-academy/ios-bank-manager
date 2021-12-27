class QueueTestDouble<T> {
    var head: Node<T>?
    weak var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
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

extension QueueTestDouble {
    class Node<S> {
        var value: S
        var next: Node?
        
        init(_ value: S) {
            self.value = value
        }
    }
}

