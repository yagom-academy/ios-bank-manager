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
        queue.removeAll()
    }
    
    func enqueue(_ data: Type) {
        queue.append(data)
    }
    
    func dequeue() {
        queue.removeFirst()
    }
}
