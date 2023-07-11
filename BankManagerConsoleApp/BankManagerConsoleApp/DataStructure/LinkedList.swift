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
    var peek: Element? { return head?.value }
    
    mutating func append(_ value: Element) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func removeFirst() -> Element? {
        guard let dequeuedValue = head?.value else { return nil }
        
        head = head?.next
        if isEmpty {
            head = nil
            tail = nil
        }
        return dequeuedValue
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
