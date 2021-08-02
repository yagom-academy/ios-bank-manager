//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/07/27.
//

import Foundation

struct Queue<Value> {
    //MARK: Properties
    private var linkedList = LinkedList<Value>()
}

//MARK:-Queue Manage Method
extension Queue {
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    mutating func enqueue(_ value: Value) {
        linkedList.append(value)
    }
    
    mutating func dequeue() -> Value? {
        return linkedList.remove()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    mutating func peek() -> Value? {
        return linkedList.glance()
    }
}
