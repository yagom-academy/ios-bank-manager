//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Luyan, Marco on 2021/07/27.
//

import Foundation

struct Queue<T> {
    private var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var peek: T? {
        return linkedList.first?.value
    }
        
    mutating func enqueue(_ element: T) {
        linkedList.append(element)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.popFirst()
    }
    
    mutating func clear() {
        linkedList.clear()
    }
}
