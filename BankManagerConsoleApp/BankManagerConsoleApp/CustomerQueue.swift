//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Mangdi, Mene on 31/10/2022.
//

import Foundation

struct CustomerQueue<T> {
    private var front: Node<T>?
    private var rear: Node<T>?
    
    var isEmpty: Bool { front == nil }
    
    mutating func enqueue(data: T?) {
        let newNode = Node(data: data, next: nil)
        
        if isEmpty {
            front = newNode
        } else {
            rear?.next = newNode
        }
        rear = newNode
    }
    
    @discardableResult mutating func dequeue() -> T? {
        let data = front?.data
        front = front?.next
        return data
    }
    
    func peek() -> T? { front?.data }
    
    mutating func clear() {
        front = nil
        rear = nil
    }
}
