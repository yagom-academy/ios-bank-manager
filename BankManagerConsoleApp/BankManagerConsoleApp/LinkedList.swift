//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/27.
//

import Foundation

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(data: T) {
        let newNode = Node<T>(data: data, next: nil)
        
        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func removeFirst() -> Node<T>? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func peekFirst() -> Node<T>? {
        return head
    }
}
