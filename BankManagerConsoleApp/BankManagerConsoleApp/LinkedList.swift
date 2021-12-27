import Foundation

final class LinkedList<Element> {
    // MARK: - Node Class
    final class Node {
        private(set) var value: Element
        var next: Node?
        
        init(value: Element) {
            self.value = value
        }
    }

    // MARK: - Properties
    private(set) var head: Node?
    private(set) var tail: Node?

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

    // MARK: - Methods
    func append(value: Element) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    func returnHead() -> Element? {
        return head?.value
    }
    
    func insert(_ value: Element, at index: Int) throws {
        let newNode = Node(value: value)
        
        if isEmpty && index == 0 {
            head = newNode
            tail = newNode
            return
        }
        
        guard index <= count else {
            throw LinkedListError.invalidIndex
        }
        
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
        
        if newNode.next == nil {
            tail = newNode
        }
    }
    
    @discardableResult
    func remove(at index: Int) throws -> Element? {
        if isEmpty && index == 0 { return nil }
        
        guard index < count else {
            throw LinkedListError.invalidIndex
        }
        
        var removedValue: Element?
        
        if index == 0 {
            count == 1 ? tail = nil : nil  // false 이면 그냥 넘어감
            removedValue = head?.value
            head = head?.next
            return removedValue
        }
        
        var indexNodeFinder = head
        
        for _ in 0..<index-1 {
            indexNodeFinder = indexNodeFinder?.next
        }
        
        removedValue = indexNodeFinder?.next?.value
        indexNodeFinder?.next = indexNodeFinder?.next?.next
        
        if indexNodeFinder?.next?.next == nil {
            tail = indexNodeFinder
        }
        
        return removedValue
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}


