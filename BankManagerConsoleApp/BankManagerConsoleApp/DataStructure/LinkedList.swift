//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/20.
//

import Foundation

struct LinkedList<Type> {

    private class Node<Type> {
        var data: Type
        var next: Node<Type>?
        
        init(data: Type) {
            self.data = data
        }
    }
    
    private var head: Node<Type>?
    private var tail: Node<Type>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func peek() -> Type? {
        return head?.data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    mutating func append(_ data: Type) {
        let newNode = Node(data: data)
        let currentTail = tail
        tail = newNode
        
        guard head != nil else {
            head = newNode
            return
        }
        
        currentTail?.next = newNode
    }
    
    mutating func removeFirst() -> Type? {
        let firstNodeData = head?.data
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return firstNodeData
    }
}
