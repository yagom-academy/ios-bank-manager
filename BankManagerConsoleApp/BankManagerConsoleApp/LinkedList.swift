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
        }
        
        return false
    }
    
    func push(_ node: Node<T>) {
        if isEmpty {
            head = node
        } else {
            tail?.next = node
        }
    
        tail = node
    }
    
    func pop() -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        let temp = head
        head = head?.next
        
        return temp
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }

    func peek() -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        return head
    }
}
