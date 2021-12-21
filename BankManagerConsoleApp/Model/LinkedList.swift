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
    var count: Int {
        var numberOfNode: Int = 0
        guard var finderToTail = head else { return numberOfNode }
        numberOfNode += 1
        
        while let nextNode = finderToTail.next {
            numberOfNode += 1
            finderToTail = nextNode
        }
        
        return numberOfNode
    }
    
    init(_ value: Element?) {
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
    
    func insert(_ value: Element, at index: Int) throws {
        guard index <= count else {
            throw LinkedListError.invalidIndex
        }
        
        let newNode = Node(value: value)
        
        if index == 0 {
            newNode.next = head
            head = newNode
            return
        }
        
        var temp = head
        
        for _ in 0..<index-1 {
            temp = temp?.next
        }
        
        newNode.next = temp?.next
        temp?.next = newNode
    }
    
    func removeFirst() -> Element? {
        if isEmpty { return nil }
        
        let valueToRemove = head?.value
        head = head?.next
        
        return valueToRemove
    }
    
    func remove(at index: Int) throws {
        guard index < count else {
            throw LinkedListError.invalidIndex
        }
                
        if index == 0 {
            head = head?.next
            return
        }
        
        var temp = head
        
        for _ in 0..<index-1 {
            temp = temp?.next
        }
        
        temp?.next = temp?.next?.next
    }
    
    func removeAll() {
        head = nil
    }
}


