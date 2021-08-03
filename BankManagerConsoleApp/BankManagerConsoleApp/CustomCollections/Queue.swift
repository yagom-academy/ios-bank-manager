//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/27.
//

import Foundation

class Queue<T> {
    // MARK:- private Properties
    private var head: Node<T>?
    private var tail: Node<T>?
    
    // MARK:- Methods
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func isNotEmpty() -> Bool {
        return head != nil
    }
    
    func enqueue(value: T) {
        let newNode = Node(value: value)
        
        if head == nil {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    func dequeue() -> T? {
        guard let headNode = head else { return nil }
        head = headNode.next
        return headNode.value
    }
    
    func peek() -> T? {
        return head?.value
    }
    
    func clear() {
        head = nil
        tail = nil
    }
}
