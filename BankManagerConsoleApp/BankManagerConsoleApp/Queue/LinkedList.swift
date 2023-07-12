//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/10.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var isEmpty: Bool { return head == nil }
    var first: T? { return head?.element }
    
    mutating func append(_ newElement: T) {
        let node = Node(element: newElement)
        
        if isEmpty {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    mutating func removeFirst() -> T? {
        let element = head?.element
        
        head = head?.next
        
        if isEmpty {
            head = nil
            tail = nil
        }
        
        return element
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
