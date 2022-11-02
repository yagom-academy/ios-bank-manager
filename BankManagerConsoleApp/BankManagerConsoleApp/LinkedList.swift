//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/01.
//

final class LinkedList<T> {
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
        
        if isEmpty == true {
            head = Node(value)
            tail = Node(value)
        } else {
            tail?.next = Node(value)
            tail = Node(value)
        }
    }
    
    func insertFirst(_ value: T) {
        count += 1
        
        if isEmpty == true {
            head = Node(value)
            tail = Node(value)
        } else {
            head?.next = head
            head = Node(value)
        }
    }
    
    func pop() -> Node<T>? {
        if head == nil {
            return nil
        }
        
        count -= 1
        if count == 1 {
            let currentNode = head
            head = nil
            
            return currentNode
        }
        
        let currentNode = head
        head = head?.next
        
        return currentNode
    }
    
    func clear() {
        head = nil
        count = 0
    }
    
    func peek() -> T? {
        return head == nil ? nil : head?.value
    }
}
