//
//  BankQueue.swift
//  
//
//  Created by Gray, Gama on 2024/03/18.
//

public struct BankQueue<T> {
    private var list: BankLinkedList<T>
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public init() {
        self.list = BankLinkedList()
    }
    
    public mutating func enqueue(element: T) {
        list.append(element: element)
    }
    
    public mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    public func peek() -> T? {
        return list.first
    }
    
    public mutating func clear() {
        list.removeAll()
    }
}
