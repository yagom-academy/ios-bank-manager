//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Kiseok on 11/13/23.
//

public struct CustomerQueue<T> {
    public private(set) var queue: LinkedList<T> = LinkedList()
    
    public var peek: T? {
        return queue.head?.data
    }
    
    public var isEmpty:Bool {
        return queue.isEmpty
    }
    
    public func enqueue(data: T) {
        queue.append(data: data)
    }
    
    @discardableResult
    public func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public func clear() {
        queue.removeAll()
    }
}
