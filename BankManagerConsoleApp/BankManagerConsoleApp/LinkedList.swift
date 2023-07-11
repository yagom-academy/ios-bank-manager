//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/10.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool { return head == nil }
    var first: T? { return head?.value }
    
    mutating func appendNode(_ value: T) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func removeFirst() -> T? {
        guard let value = head?.value else { return nil }
        
        head = head?.next
        
        if isEmpty {
            head = nil
            tail = nil
        }
        
        return value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
