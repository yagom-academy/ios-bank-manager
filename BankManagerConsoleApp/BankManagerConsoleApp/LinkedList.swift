//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/28.
//

import Foundation

class LinkedList<T> {
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    private var count: Int = 0
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func append(_ value: T) {
        let newNode = Node<T>(value: value)
        if isEmpty() {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    func bringValueOfFirst() -> T? {
        return head?.value
    }
    
    func removeFirst() -> T? {
        defer {
            head = head?.next
        }
        return head?.value
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
