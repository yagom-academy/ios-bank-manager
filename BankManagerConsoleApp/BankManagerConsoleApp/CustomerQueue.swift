//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import Foundation

struct CustomerQueue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return false
    }
    
    func enqueue(value: T) {
        
    }
    
    func dequeue() -> T? {
        return nil
    }
    
    func clear() {
        
    }
    
    func peek() -> T? {
        return nil
    }
}
