final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var first: T? {
        return head != nil ? head?.data : nil
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ element: T) {
        if isEmpty {
            head = Node(data: element)
            tail = head
        } else {
            let newNode = Node(data: element)
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        }
    }
    
    @discardableResult
    func removeFirst() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        let data = head?.data
        
        if head?.next != nil {
            head = head?.next
        } else {
            head = nil
        }
        
        return data
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
