//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/07/27.
//

import Foundation

class LinkedList<Value> {
    private var head: Node<Value>?
    private var tail: Node<Value>?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func append(_ value: Value) {
        guard !isEmpty() && tail != nil else {
            head = Node(value: value)
            tail = head
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
}
