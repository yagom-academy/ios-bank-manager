//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/27.
//

import Foundation

class Queue<T> {
    private var linkedList = LinkedList<T>()
    
    func enqueue(_ value: T) {
        linkedList.append(value)
    }
    
    func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> T? {
        return linkedList.bringValueOfFirst()
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
}
