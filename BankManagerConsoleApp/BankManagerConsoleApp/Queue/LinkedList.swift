//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

import Foundation

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    var count: Int {
        var node = head
        var count = 0

        while node != nil {
            count += 1
            node = node?.next
        }

        return count
    }
    
    func peek() -> T? {
        return head?.value
    }
    
    func append(value: T) {
        let newNode = Node(value: value)

        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func removeFirst() -> T? {
        let value = head?.value
       
        head = head?.next
        
        return value
    }
    
    func removeAll() {
        guard !isEmpty else {
            return
        }
        
        head = nil
        tail = nil
    }
}
