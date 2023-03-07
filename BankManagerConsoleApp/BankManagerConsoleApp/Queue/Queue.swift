//
//  BankQueue.swift
//  BankManagerConsoleApp
//  Created by Rhode, sehong.
//

struct Queue<T> {
    private var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var peek: T? {
        return linkedList.peek
    }
    
    mutating func enqueue(_ data: T) {
        linkedList.append(data)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.pop()
    }
    
    mutating func clear() {
        linkedList.clear()
    }
}
