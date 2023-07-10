//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/10.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: T? {
        return head?.element
    }
    
    mutating func append(_ newElement: T) {
        if isEmpty {
            head = Node(element: newElement)
            tail = head
        } else {
            let node = Node(element: newElement)
            tail?.next = node
            tail = node
        }
    }
    
    mutating func removeFirst() -> T? {
        guard let element = head?.element else { return nil }
        
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
