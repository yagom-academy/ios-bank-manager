//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    var first: T? {
        return head?.value
    }
    
    mutating func append(value: T) {
        let newNode = Node(value: value)
        if isEmpty {
            head = newNode
            tail = head
            return
        }
        
        newNode.previous = tail
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func removeFirst() -> T? {
        if isEmpty {
            return nil
        }
        
        let dequeueValue = head?.value
        head = head?.next
        return dequeueValue
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
