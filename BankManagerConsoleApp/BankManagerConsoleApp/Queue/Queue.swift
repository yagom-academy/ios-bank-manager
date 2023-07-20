//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

struct Queue<T> {
    private var linkedList: LinkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var count: Int {
        return linkedList.count
    }
    
    func peek() -> T? {
        return linkedList.peek()
    }
    
    mutating func enqueue(_ element: T) {
        linkedList.append(value: element)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
}
