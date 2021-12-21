import Foundation

final class LinkedList<Element> {
    final class ListNode<Element> {
        private(set) var value: Element
        var next: ListNode?
        
        init(value: Element) {
            self.value = value
        }
    }
    
    typealias Node = ListNode<Element>
    
    private(set) var head: Node?
    var tail: Node? {
        var finderToTail: Node? = head
        
        while let nextNode = finderToTail?.next {
            finderToTail = nextNode
        }
        
        return finderToTail
    }
    var isEmpty: Bool {
        return head == nil
    }
    
    init(value: Element?) {
        if let value = value {
            self.head = Node(value: value)
        }
    }
    
    func append(value: Element) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
    }
    
    func removeFirst() -> Element? {
        if isEmpty { return nil }
        
        let valueToRemove = head?.value
        head = head?.next
        
        return valueToRemove
    }
    
    func removeAll() {
        head = nil
    }
}


