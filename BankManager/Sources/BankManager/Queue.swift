//
//  Queue.swift
//
//
//  Created by Diana, Hamzzi on 3/18/24.
//

public struct Queue<Element> {
    private var list = LinkedList<Element>()
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public var count: Int {
        list.count
    }
    
    public mutating func dequeue() -> Element? {
        return list.removeFirst()
    }
    
    public mutating func enqueue(_ value: Element) {
        list.append(value)
    }
    
    public mutating func peek() -> Element? {
        return list.peek()
    }
    
    public mutating func clear() {
        list.clear()
    }
}
