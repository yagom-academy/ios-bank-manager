//
//  BankQueue.swift
//  BankManagerUIApp
//
//  Created by Goat, Andrew on 2023/03/06.
//

import Foundation

struct BankQueue<T> {
    final class Node<T> {
        var data: T?
        var next: Node?
        
        init(data: T?, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
    
    private(set) var head: Node<T>?
    
    // Enqueue, Dequeue, Clear, Peek, isEmpty
    
    mutating func enqueue(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if head == nil { return nil }
        
        head = head?.next
        return head?.data
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func clearAll() {
        head = nil
    }
}
