class LinkedList<T> {
    var head: Node<T>?
    
    var first: T? {
        return head?.data
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ element: T) {
        guard head != nil else {
            head = Node(data: element)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: element)
    }
    
    func removeFirst() -> T? {
        guard head != nil else {
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
    }
}
