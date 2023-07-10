//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/10.
//

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    mutating func append(_ value: Value) {
        let newNode = Node(value)
        
        guard head != nil else {
            head = newNode
            tail = head
            return
        }
        
        tail?.next = newNode
        tail = tail?.next
    }
}
