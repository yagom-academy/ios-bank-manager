//
//  LinkedList.swift
//
//
//  Created by Diana, Hamzzi on 3/18/24.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard head != nil else { return 0 }
        
        var temporary = 0
        var current = head
        
        repeat {
            temporary += 1
            current = current?.next
        } while current != nil
        
        return temporary
    }
    
    mutating func append(_ value: Element) {
        let newNode = Node(value: value)
        guard let tailNode = tail else {
            head = newNode
            return
        }
        tail?.next = newNode
        tail = tail?.next
    }
    
    mutating func removeFirst() -> Element? {
        guard let headNode = head else {
            return nil
        }
        
        let value = headNode.value
        head = headNode.next
        
        if head == nil {
            tail = nil
        }
        
        return value
    }
    
    mutating func removeLast() -> Element? {
        guard let headNode = head else {
            return nil
        }
        
        guard headNode.next != nil else {
            head = nil
            tail = nil
            return headNode.value
        }
        
        var prev = headNode
        var current = headNode
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return current.value
    }
    
    func peek() -> Element? {
        return head?.value
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
