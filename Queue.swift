//
//  Queue.swift
//  BankManagerUIApp
//
//  Created by kaki, songjun on 2023/03/06.
//

struct Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(_ data: T) {
        if head == nil {
            head = Node.init(data)
            tail = head
        } else {
            let newNode = Node.init(data)
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func dequeue() -> T? {
        if head == nil { return nil }
        
        let dequeue = head
        head = head?.next
        dequeue?.next = nil
        
        return dequeue?.data
    }
    
    func peek() -> T? {
        return head?.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
