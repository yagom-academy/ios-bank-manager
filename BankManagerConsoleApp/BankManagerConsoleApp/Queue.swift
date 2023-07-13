//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/10.
//

struct Queue<Value> {
    private var list = LinkedList<Value>()
    
    var peek: Value? {
        return list.first
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ value: Value) {
        list.append(value)
    }
    
    mutating func dequeue() -> Value? {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
}

//MARK: - Extension for Unit Test
#if canImport(XCTest)
extension Queue {
    var exposedList: LinkedList<Value> {
        return list
    }
    
    var count: Int {
        return list.count
    }
}
#endif
