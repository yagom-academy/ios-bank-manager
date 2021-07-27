//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Kim Do hyung on 2021/07/27.
//

import Foundation

class Queue<T> {
    private let linkedList = LinkedList<T>()
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty
    }
    
    func peek() -> T? {
        return linkedList.getFirst()?.value
    }
    
    func clear() {
        linkedList.clear()
    }
    
    func enqueue(_ vlaue: T) {
        linkedList.append(vlaue)
    }
    
    func dequeue() {
        linkedList.removeFirst()
    }
}
