//
//  BankCustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

public struct BankCustomerQueue: Queue {
    private var linkedList: LinkedList<Queueable> = .init()
    
    public mutating func enqueue(_ element: Queueable) {
        self.linkedList.pushLast(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> Queueable? {
        return self.linkedList.popFirst()?.data
    }
    
    public mutating func clear() {
        self.linkedList.clear()
    }
    
    public func peek() -> Queueable? {
        return self.linkedList.peek()?.data
    }
    
    public func isEmpty() -> Bool {
        return self.linkedList.isEmpty()
    }
}
