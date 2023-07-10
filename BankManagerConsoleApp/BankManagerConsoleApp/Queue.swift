//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/10.
//

struct Queue<Value> {
    private var elements = LinkedList<Value>()
    
    var peek: Value? {
        return elements.first
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func enqueue(_ value: Value) {
        elements.append(value)
    }
    
    mutating func dequeue() -> Value? {
        return elements.removeFirst()
    }
    
    mutating func clear() {
        elements.removeAll()
    }
}
