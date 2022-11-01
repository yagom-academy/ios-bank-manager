//
//  BankCustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

struct BankCustomerQueue: Queue {
    private var linkedList: LinkedList<Queueable> = .init()
    
    mutating func enqueue(_ element: Queueable) {
        self.linkedList.pushLast(element)
    }
    
    mutating func dequeue() -> Queueable? {
        return self.linkedList.popFirst()?.data
    }
    
    mutating func clear() {
        self.linkedList.clear()
    }
    
    func peek() -> Queueable? {
        return self.linkedList.peek()?.data
    }
    
    func isEmpty() -> Bool {
        return self.linkedList.isEmpty()
    }
}
