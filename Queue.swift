//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by kaki, songjun on 2023/03/06.
//

struct Queue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
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
}
