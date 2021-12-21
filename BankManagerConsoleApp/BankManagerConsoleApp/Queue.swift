//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 양호준 on 2021/12/21.
//

import Foundation

struct Queue<Type> {
    var queue: LinkedList<Type>
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    func peek() -> Type {
        queue.peek()
    }
    
    func clear() {
        queue.clear()
    }
    
    func enqueue(_ data: Type) {
        queue.enqueue(data)
    }
    
    func dequeue() {
        queue.dequeue()
    }
}
