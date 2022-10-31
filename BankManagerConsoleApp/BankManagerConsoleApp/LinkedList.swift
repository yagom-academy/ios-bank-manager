//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Tottale, Aaron on 2022/10/31.
//

final class LinkedList<T> {
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
    
    func removeAll() {
        self.head = nil
        self.tail = nil
    }

    func peek() -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        return self.head
    }
}
