final public class LinkedList<T> {
    final public class Node {
        private(set) var data: T
        private(set) var next: Node?
        
        init(data: T) {
            self.data = data
        }
        
        func setNext(_ node: Node?) {
            self.next = node
        }
    }
    
    private(set) var head: Node?
    private(set) var tail: Node?
    
    init(head: Node? = nil, tail: Node? = nil) {
        self.head = head
        self.tail = tail
    }
    
    public func append(data: T) {
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
        } else {
            tail?.setNext(newNode)
        }
        
        tail = newNode
        
    }
    
    @discardableResult
    public func removeFirst() -> T? {
        guard let headData = head?.data else { return nil }
        
        head = head?.next
        
        return headData
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func showFirstNode() -> T? {
        guard let data = head?.data else { return nil }
        return data
    }
    
    public func count() -> Int {
        guard var currentNode = head else {
            return 0
        }
        
        var count = 1
        
        while currentNode.next != nil {
            guard let next = currentNode.next else {
                return count
            }
            
            currentNode = next
            count += 1
        }
        return count
    }
}
