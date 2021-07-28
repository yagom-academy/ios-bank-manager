//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 김태영 on 2021/07/27.
//

import Foundation

struct LinkedListQueue<T> {
    
    private let list = LinkedList<T>()
    
    var peek: T? {
        return list.headValue
    }
    
    mutating func enqueue(value: T) {
        list.append(value: value)
    }
    
    mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    mutating func isEmpty() -> Bool {
        return list.headIsEmpty
    }
}
