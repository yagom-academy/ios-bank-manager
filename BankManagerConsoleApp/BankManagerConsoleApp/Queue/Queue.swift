//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/10.
//

struct Queue<T> {
    private var queue: LinkedList = LinkedList<T>()
    
    var peek: T? {
        return queue.first
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
