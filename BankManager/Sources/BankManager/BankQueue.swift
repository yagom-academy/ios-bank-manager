//
//  File.swift
//  
//
//  Created by hyunMac on 11/13/23.
//
public struct BankQueue<T> {
    private let list = LinkedList<T>()
    
    public func enqueue(data: T) {
        list.append(data: data)
    }
    
    @discardableResult
    public func dequeue() -> T? {
        list.removeFirst()
    }
    
    public func clear() {
        list.removeAll()
    }
    
    public func peek() -> T? {
        list.showFirstNode()
    }
    
    public func isEmpty() -> Bool {
        list.count() == 0
    }
}
