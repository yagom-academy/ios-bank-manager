//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 김태영 on 2021/07/27.
//

import Foundation

class LinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?

    var headIsEmpty: Bool {
        head == nil
    }
    
    var headValue: T? {
        return head?.value
    }
    
    var tailValue: T? {
        return tail?.value
    }
    
    func append(value: T) {
        if headIsEmpty {
            head = Node(value: value, next: nil)
        }
        if tail == nil {
            tail = head
        } else if tail != nil {
            tail?.next = Node(value: value, next: nil)
        }
    }
    
    func removeFirst() -> T? {
        defer {
            head = head?.next
            if headIsEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
