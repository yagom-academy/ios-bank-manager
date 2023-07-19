//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/10.
//

struct Queue<T> {
    private var queue: LinkedList = LinkedList<T>()
    var isEmpty: Bool { return queue.isEmpty }
    var peek: T? { return queue.first }

    mutating func enqueue(_ newElement: T) {
        queue.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
