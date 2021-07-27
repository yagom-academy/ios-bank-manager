//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/07/27.
//

import Foundation

class Queue<Value> {
    let linkedList = LinkedList<Value>()
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    func enqueue(_ value: Value) {
        linkedList.append(value)
    }
    
    func dequeue(_ value: Value) -> Value? {
        return linkedList.remove(value)
    }
}
