//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(data: T) {
        let newNode = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
    }
    
    mutating func removeFirst() -> T? {
        if isEmpty {
            return nil
        }
        
        if head == tail {
            tail = nil
        }
        
        let data = head?.data
        head = head?.next
        
        return data
    }
    
    func first() -> T? {
        return head?.data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
