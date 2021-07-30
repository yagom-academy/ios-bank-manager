//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 김태영 on 2021/07/27.
//

import Foundation

class LinkedListQueue<T> {
    
    private let list = LinkedList<T>()
    
    var peek: T? {
        return list.headValue
    }
    
    func enqueue(value: T) {
        list.append(value: value)
    }
    
    func dequeue() -> T? {
        return list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
    
    func isEmpty() -> Bool {
        return list.headIsEmpty
    }
}
