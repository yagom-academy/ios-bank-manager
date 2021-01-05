//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Kyungmin Lee on 2021/01/04.
//

import Foundation

struct Queue<T> {
    private var data = [T]()
    
    var count: Int {
        return data.count
    }
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    mutating func enqueue(element: T) {
        data.append(element)
    }
    
    mutating func dequeue() -> T? {
        if data.isEmpty {
            return nil
        } else {
            return data.removeFirst()
        }
    }
    
    public func peek() -> T? {
        return data.first
    }
    
    mutating func clear() {
        data.removeAll()
    }
}
