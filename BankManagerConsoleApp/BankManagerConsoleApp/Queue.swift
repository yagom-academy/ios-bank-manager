struct Queue<T> {
    private var head: Node<T>?
    private weak var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(_ value: T) {
        if isEmpty {
            let node = Node(value)
            head = node
            tail = node
        } else {
            let node = Node(value)
            tail?.next = node
            tail = node
        }
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        
        let value = head?.value
        head = head?.next
        return value
    }
    
    mutating func clear() {
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
        
        init(_ value: S, next: Node? = nil) {
            self.next = next
            self.value = value
        }
    }
}
