struct LinkedList<T> {
    var head: Node<T>?
    
    var first: T? {
        return head?.data
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ element: T) {
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
    
    mutating func removeLast() -> T? {
        guard head != nil else {
            return nil
        }
        
        if head?.next == nil {
            let data = head?.data
            head = nil
            return data
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        
        let data = node?.next?.data
        node?.next = node?.next?.next
        
        return data
    }
    
    mutating func removeAll() {
        head = nil
    }
}
