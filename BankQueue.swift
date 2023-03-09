//
//  BankQueue.swift
//  BankManagerUIApp
//
//  Created by Goat, Andrew on 2023/03/06.
//

import Foundation

struct BankQueue<T> {
    final class Node<T> {
        let data: T
        var next: Node?

        init(data: T, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
    
    private(set) var head: Node<T>?
    
    mutating func enqueue(data: T) {
        guard isEmpty() == false else {
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
        guard isEmpty() == false else { return nil }
        
        head = head?.next
        return head?.data
    }
    
    func peek() -> T? {
        head?.data
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func clearAll() {
        head = nil
    }
}
