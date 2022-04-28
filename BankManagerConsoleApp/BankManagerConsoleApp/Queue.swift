//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct Queue<T> {
    private var list = LinkedList<T>()
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var peek: T? {
        return list.first
    }
    
    mutating func enqueue(_ value: T) {
        list.append(value: value)
    }
    
    mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
