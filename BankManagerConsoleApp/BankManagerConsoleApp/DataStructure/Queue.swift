//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/06.
//

import Foundation

struct Queue<T> {
    private var queue = LinkedList<T>()
    var peek: T? { queue.peek }
    var isEmpty: Bool { queue.isEmpty }
    
    mutating func enqueue(_ data: T) {
        queue.appendLast(data)
    }
    
    mutating func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
