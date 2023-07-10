//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Whales, Zion on 2023/07/10.
//

struct LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var first: Element? {
        return head?.data
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: Element) {
        let node = Node(data: data)
        
        if isEmpty {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    mutating func removeFirst() -> Element? {
        let data = head?.data
        
        if head?.next == nil {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        
        return data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
