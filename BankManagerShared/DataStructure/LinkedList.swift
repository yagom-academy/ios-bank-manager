import Foundation

class LinkedList<T> {
    private class Node {
        var data: T
        var next: Node?
        
        init(data: T, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
    
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    init() {
        self.head = nil
        self.tail = nil
    }
    
    func append(_ item: T) {
        let newNode: Node = Node(data: item)
        if tail != nil {
            tail?.next = newNode
        }
        tail = newNode
        if head == nil {
            head = tail
        }
    }
    
    func removeFirst() -> T? {
        let returnValue: T? = peek()
        head = head?.next
        
        return returnValue
    }
    
    func peek() -> T? {
        guard isEmpty == false else {
            return nil
        }
        let returnValue: T? = head?.data
        
        return returnValue
    }
}
