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
        if let headNode = head {
            let value = headNode.value
            head = headNode.next
            if head == nil {
                tail = nil
            }
            return value
        } else {
            return nil
        }
    }
    
    mutating func removeLast() -> Element? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return head.value
        }
        
        var prev = head
        var current = head
        
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
