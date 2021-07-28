//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/27.
//

import Foundation

class Node<T> {
    var value: T?
    var next: Node?
    
    init(value: T?, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedListQueue<T> {
    private var head: Node<T>? = nil
    var tail: Node<T>? = nil
    private var count: Int = 0
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    func enqueue(_ value: T) {
        let newNode = Node<T>(value: value)
        
        if isEmpty() {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
        count += 1
        print(value)
    }
    
    func peek() -> T? {
        if isEmpty() {
            return nil
        }
        return head?.value
    }
    
    func dequeue() -> T? {
        if isEmpty() {
            return nil
        }
        guard let peekedNode = peek() else {
            return nil
        }
        
        let nextNode = head?.next
        
        head?.value = nil
        head?.next = nil
        head = nextNode
        
        count -= 1
        
        return peekedNode
    }
    
    func clear() {
        while head != nil {
            guard let nextNode = head?.next else { break }
            head?.value = nil
            head?.next = nil
            head = nextNode
        }
        count = 0
        tail = nil
    }
}
