//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/10.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool { return head == nil }
    var first: T? { return head?.value }
    
    mutating func appendNode(_ value: T) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = head
            count += 1
        } else {
            tail?.next = newNode
            tail = newNode
            count += 1
        }
    }
    
    mutating func removeFirst() -> T? {
        guard let value = head?.value else { return nil }
        
        head = head?.next
        
        if isEmpty {
            head = nil
            tail = nil
            count -= 1
        }
        
        return value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    mutating func insert(value: T, index: Int) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head = newNode
            if tail == nil {
                tail = newNode
            }
            count += 1
        } else {
            var previousNode = head
            for _ in 1..<index {
                if previousNode?.next == nil { break }
                previousNode = previousNode?.next
            }
            
            newNode.next = previousNode?.next
            previousNode?.next = newNode
            
            if newNode.next == nil {
                tail = newNode
            }
            count += 1
        }
    }
}
