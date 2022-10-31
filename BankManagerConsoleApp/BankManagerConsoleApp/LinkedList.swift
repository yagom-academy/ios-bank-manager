//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Tottale, Aaron on 2022/10/31.
//

class Node<T> {
    let value: T
    var next: Node?
    
    init(_ value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    func push(_ node: Node<T>) {
        if self.isEmpty {
            self.head = node
            self.tail = node
            return
        }

        self.tail?.next = node
        self.tail = node
    }
    
    func pop() -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        let temp = self.head
        self.head = self.head?.next
        
        return temp
    }
}
