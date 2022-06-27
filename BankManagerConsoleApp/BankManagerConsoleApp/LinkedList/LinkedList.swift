//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Baek on 2022/06/27.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: Node<T>? {
        return head
    }
    mutating func append(data: T?) {
        let newValue = Node(data: data)
        
        if head == nil {
            head = newValue
            tail = head
        } else {
            tail?.next = newValue
            tail = newValue
        }
    }
