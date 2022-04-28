//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/25.
//

struct Queue<T> {
    private let linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    func enqueue(data: T) {
        linkedList.append(data: data)
    }
    
    func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    func peek() -> T? {
        return linkedList.peek()
    }
    
    func clear() {
        linkedList.clear()
    }
}
