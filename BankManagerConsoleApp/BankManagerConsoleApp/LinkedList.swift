import Foundation

final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ data: T) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
        } else {
            newNode.prev = tail
            tail?.next = newNode
        }
        
        tail = newNode
    }
    
    func removeFirst() -> T? {
        guard let data = head?.data else {
            return nil
        }
        head = head?.next
        
        return data
    }
    
    func clear() {
        head = nil
        tail = nil
    }
}
