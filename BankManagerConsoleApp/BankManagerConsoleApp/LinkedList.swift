//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/10.
//

struct LinkedList<Value> {
    private var head: Node<Value>?
    private var tail: Node<Value>?
    
    var peek: Value? {
        return head?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
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
    
    mutating func removeFirst() -> Value? {
        guard head != nil else {
            return nil
        }
        
        let value = head?.value
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
