//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Kim Do hyung on 2021/07/27.
//

import Foundation

class Queue<T> {
    private let linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var peek: T? {
        return linkedList.first?.value
    }
    
    func clear() {
        linkedList.clear()
    }
    
    func enqueue(_ value: T) {
        linkedList.append(value)
    }
    
    func dequeue() -> T? {
        let fistNode = linkedList.first
        linkedList.removeFirst()
        return fistNode?.value
    }
}
