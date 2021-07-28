//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 김태영 on 2021/07/27.
//

import Foundation

class LinkedList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        head == nil
    }
    
    func append(value: T) {
        if isEmpty {
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
            if isEmpty {
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
