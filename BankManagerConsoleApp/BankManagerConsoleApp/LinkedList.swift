import Foundation

final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count: Int = 0
    
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
        count += 1
        tail = newNode
    }
    
    func removeHead() -> T? {
        guard let data = head?.data else {
            return nil
        }
        head = head?.next
        count -= 1
        
        return data
    }
    
    func clear() {
        head = nil
        tail = nil
        count = 0
    }
}
