//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct Queue<T> {
    private var list = LinkedList<T>()
    private(set) var count = 0
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var peek: T? {
        return list.first
    }
    
    mutating func enqueue(_ value: T) {
        count += 1
        list.append(value: value)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            count = 0
        } else {
            count -= 1
        }
        return list.removeFirst()
    }
    
    mutating func clear() {
        count = 0
        list.removeAll()
    }
}
