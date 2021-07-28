//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/07/27.
//

import Foundation

struct LinkedList<Value> {
    //MARK: Properties
    private var head: Node<Value>?
    private var tail: Node<Value>?
}

//MARK:- Node Manage Method
extension LinkedList {
    func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func append(_ value: Value) {
        if isEmpty() {
            head = Node(value: value)
            tail = head
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    mutating func remove() -> Value? {
        defer { head = head?.next }
        return head?.value ?? nil
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    func glance() -> Value? {
        return head?.value
    }
}
