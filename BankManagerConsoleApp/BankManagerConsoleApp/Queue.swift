struct Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
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
}

extension Queue {
    class Node<S> {
        var value: S
        var next: Node?
        
        init(_ value: S, next: Node? = nil) {
            self.next = next
            self.value = value
        }
    }
}
