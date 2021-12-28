//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 양호준 on 2021/12/21.
//

import Foundation

struct Queue<Type> {
    var queue = LinkedList<Type>()
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    func peek() -> Type? {
        return queue.peek()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
    
    mutating func enqueue(_ data: Type) {
        queue.append(data)
    }
    
    @discardableResult
    mutating func dequeue() -> Type? {
        return queue.removeFirst()
    }
}
