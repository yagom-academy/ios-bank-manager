//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/01.
//

final class LinkedList<T: Equatable> {
    final class Node<T> {
        var value: T
        var next: Node?
        
        init(_ value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        if count == 0 {
            return true
        } else {
            return false
        }
    }
    
    func insertLast(_ value: T) {
        count += 1
        
        if isEmpty {
            head = Node(value)
            tail = Node(value)
        } else {
            tail?.next = Node(value)
            tail = Node(value)
        }
    }
    
    func insertFirst(_ value: T) {
        if isEmpty {
            head = Node(value)
            tail = Node(value)
        } else {
            head?.next = head
            head = Node(value)
        }
        
        count += 1
    }
    
    func search(_ value: T) -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        var currentNode = head
        while currentNode?.next != nil {
            if currentNode?.value == value {
                break
            }
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    func removeFirst() -> Node<T>? {
        if isEmpty {
            return nil
        }
        let currentNode = head
        
        if count == 1 {
            head = nil
            
            return currentNode
        }
        
        head = head?.next
        count -= 1
        
        return currentNode
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    func peek() -> T? {
        return head == nil ? nil : head?.value
    }
}
