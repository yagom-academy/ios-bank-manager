//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Kiseok on 11/13/23.
//

public struct CustomerQueue<T: CustomerProtocol> {
    public private(set) var queue: LinkedList<T> = .init()
    
    public var peek: T? {
        return queue.head?.data
    }
    
    public var isEmpty:Bool {
        return queue.isEmpty
    }
    
    public var hasCustomer: Int {
        return queue.count
    }
    
    public init() {}
    
    public func enqueue(_ customer: T) {
        queue.append(data: customer)
    }
    
    @discardableResult
    public func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public func clear() {
        queue.removeAll()
    }
}
