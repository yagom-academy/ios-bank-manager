//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/01.
//

struct Queue<T> {
    
    private var linkedList: LinkedList<T> = LinkedList()
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        linkedList.addLast(element)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeFirst()
    }

    mutating func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> T? {
        return linkedList.firstValue
    }
}
