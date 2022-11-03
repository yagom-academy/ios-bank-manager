//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import Foundation

struct CustomerQueue<T> {
    private var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(value: T) {
        linkedList.append(data: value)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> T? {
        return linkedList.first()
    }
}
