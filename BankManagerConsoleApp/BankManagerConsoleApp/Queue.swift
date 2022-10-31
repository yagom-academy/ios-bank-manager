//
//  Queue.swift
//  Created by sunnycookie, inho
//

import Foundation

struct Queue<T> {
    private(set) var queue: LinkedList<T> = LinkedList()
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ data: T) {
        queue.append(data)
    }
    
    mutating func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    mutating func peek() -> T? {
        return queue.head?.data
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
