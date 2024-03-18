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
    
    mutating func enqueue(_ value: Element) {
        let newNode = Node(value: value)
        guard let tailNode = tail else {
            head = newNode
            return
        }
        tail?.next = newNode
        tail = tail?.next
    }
    
    mutating func dequeue() -> Element? {
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
    
    func peek() -> Element? {
        return head?.value
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
