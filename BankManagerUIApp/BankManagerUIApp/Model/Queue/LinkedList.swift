//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Whales, Zion on 2023/07/10.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private(set) var count: Int = 0
    
    var first: Element? {
        return head?.data
    }
    
    var last: Element? {
        return tail?.data
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
        
        count += 1
    }
    
    mutating func removeFirst() -> Element? {
        let data = head?.data
        
        if head?.next == nil {
            head = nil
            tail = nil
            count = 0
        } else {
            head = head?.next
            count -= 1
        }
        
        return data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
