//
//  BankCustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

public struct BankCustomerQueue<DataType>: Queue {
    private var linkedList: LinkedList<DataType> = .init()
    
    public mutating func enqueue(_ element: DataType) {
        self.linkedList.pushLast(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> DataType? {
        return self.linkedList.popFirst()?.data
    }
    
    public mutating func clear() {
        self.linkedList.clear()
    }
    
    public func peek() -> DataType? {
        return self.linkedList.peek()?.data
    }
    
    public func isEmpty() -> Bool {
        return self.linkedList.isEmpty()
    }
}
