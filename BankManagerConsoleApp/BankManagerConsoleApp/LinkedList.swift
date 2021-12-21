//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/20.
//

import Foundation

struct LinkedList<Type> {
    var head: Node<Type>?
    var tail: Node<Type>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    func peek() -> Type? {
        return head?.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    mutating func enqueue(_ data: Type) {
        let newNode = Node(data: data)
        
        if let lastNode = tail {
            lastNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    mutating func dequeue() {
        head = head?.next
    }
}

class Node<Type> {
    var data: Type
    var next: Node<Type>?
    
    init(data: Type, next: Node<Type>? = nil) {
        self.data = data
        self.next = next
    }
}
