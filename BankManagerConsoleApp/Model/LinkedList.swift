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
        
        var indexNodeFinder = head
        
        for _ in 0..<index-1 {
            indexNodeFinder = indexNodeFinder?.next
        }
        
        newNode.next = indexNodeFinder?.next
        indexNodeFinder?.next = newNode
    }
    
    @discardableResult
    func remove(at index: Int) throws -> Element? {
        if isEmpty && index == 0 { return nil }
        
        guard index < count else {
            throw LinkedListError.invalidIndex
        }
        
        var valueToRemove: Element?
        
        if index == 0 {
            valueToRemove = head?.value
            head = head?.next
            return valueToRemove
        }
        
        var indexNodeFinder = head
        
        for _ in 0..<index-1 {
            indexNodeFinder = indexNodeFinder?.next
        }
        
        valueToRemove = indexNodeFinder?.next?.value
        indexNodeFinder?.next = indexNodeFinder?.next?.next
        
        return valueToRemove
    }
    
    func removeAll() {
        head = nil
    }
}


