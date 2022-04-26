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
    private(set) var count = 0
    
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
            count += 1
            return
        }
        
        let newNode = Node(value: value, previous: tail)
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        
        let dequeueValue = head?.value
        head = head?.next
        count -= 1
        return dequeueValue
    }
    
    mutating func clearAll() {
        head = nil
        tail = nil
        count = 0
    }
}
