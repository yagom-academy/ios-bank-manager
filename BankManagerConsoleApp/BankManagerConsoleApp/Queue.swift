//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/27.
//

import Foundation

struct Queue<T> {
    private var linkedList = LinkedList<T>()
    
    mutating func enqueue(_ value: T) {
        linkedList.append(value)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.remove()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    mutating func peek() -> T? {
        return linkedList.checkFirst()
    }
    
    mutating func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
}
