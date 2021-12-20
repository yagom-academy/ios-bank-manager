import Foundation

struct LinkedList<T> {
    var head: Node<T>?
    
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
}
