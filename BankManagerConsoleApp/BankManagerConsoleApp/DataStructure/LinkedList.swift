//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/11.
//

struct LinkedList<Element> {
    private(set) var head: Node<Element>?
    private(set) var tail: Node<Element>?
    var isEmpty: Bool { return head == nil }
    var peek: Element? { return head?.element }
    
    mutating func append(_ element: Element) {
        let newNode = Node(element: element)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func removeFirst() -> Element? {
        guard let dequeuedValue = head?.element else { return nil }
        
        if isEmpty {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        return dequeuedValue
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
