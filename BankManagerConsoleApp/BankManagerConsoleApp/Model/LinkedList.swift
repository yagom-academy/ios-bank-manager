import Foundation

class Node<Element> {
    var data: Element?
    var next: Node?
    
    init(data: Element?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    var isEmpty: Bool {
        return head == nil
    }
    var first: Element? {
        return head?.data
    }
    
    init() { }
    
    init(data: Element?) {
        self.head = Node(data: data, next: nil)
        self.tail = head
    }
    
    mutating func append(data: Element) {
        let nextNode = Node(data: data, next: nil)
        guard isEmpty else {
            tail?.next = nextNode
            tail = nextNode
            return
        }
        head = nextNode
        tail = head
    }
    
    mutating func removeFirst() -> Element? {
        guard isEmpty else {
            let first = head?.data
            head = head?.next
            return first
        }
        return nil
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
