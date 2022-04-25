//
//  DoubleLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct DoubleLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var count = 0
    
    var isEmpty: Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    var peek: T? {
        return head?.value
    }
    
    mutating func enqueue(value: T) {
        if isEmpty {
            head = Node(value: value)
            tail = head
            return
        }
        
        let newNode = Node(value: value, previous: tail)
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        
        let dequeueValue = head?.value
        head = head?.next
        return dequeueValue
    }
}
