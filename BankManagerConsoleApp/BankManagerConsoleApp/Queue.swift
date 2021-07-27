//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/27.
//

import Foundation

class Node<T> {
    private var value: T?
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
    
    func enqueue(_ value: Node<T>) {
        let newNode = value
        
        if isEmpty() {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
}
