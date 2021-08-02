//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Luyan, Marco on 2021/07/27.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    var first: Node<T>? {
        return head
    }
        
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    mutating func push(_ newValue: T) {
        head = Node(value: newValue, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ newValue: T) {
        if let tail = tail {
            tail.next = Node(value: newValue, next: nil)
            self.tail = tail.next
        } else {
            push(newValue)
        }
    }
    
    mutating func popFirst() -> T? {
        defer {
            head = head?.next
            if head == nil {
                tail = nil
            }
        }
        return head?.value
    }
}
