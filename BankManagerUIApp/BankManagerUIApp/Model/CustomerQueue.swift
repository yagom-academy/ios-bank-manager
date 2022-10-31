//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Mangdi, Mene on 31/10/2022.
//

import Foundation

struct CustomerQueue<T> {
    var front: Node<T>?
    var rear: Node<T>?
    
    var isEmpty: Bool {
        rear == nil ? true : false
    }
    
    mutating func enqueue(data: T?) {
        let newNode = Node(data: data, next: nil)
        
        if isEmpty {
            front = newNode
            rear = newNode
        } else {
            rear?.next = newNode
            rear = newNode
        }
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            let data = front?.data
            front = front?.next
            return data
        }
    }
    
    func peek() -> T? {
        isEmpty ? nil : front?.data
    }
    
    mutating func clear() {
        front = nil
        rear = nil
    }
}
