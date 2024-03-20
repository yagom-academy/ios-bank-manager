//
//  Queue.swift
//
//
//  Created by Diana, Hamzzi on 3/18/24.
//

struct Queue<Element> {
    private var list = LinkedList<Element>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    var count: Int {
        list.count
    }
    
    mutating func dequeue() -> Element? {
        return list.removeFirst()
    }
    
    mutating func enqueue(_ value: Element) {
        list.append(value)
    }
    
    mutating func peek() -> Element? {
        return list.peek()
    }
    
    mutating func clear() {
        list.clear()
    }
}
