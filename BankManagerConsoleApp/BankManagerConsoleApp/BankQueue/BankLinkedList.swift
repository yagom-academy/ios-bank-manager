//
//  BankLinkedList.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: T? {
        return head?.data
    }
    
    mutating func push(_ data: T) {
        head = Node(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ data: T) {
        guard !isEmpty else {
            push(data)
            return
        }
        tail!.next = Node(data: data)
        tail = tail!.next
    }
    
    
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil 
    }
}
