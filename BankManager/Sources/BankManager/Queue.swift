//
//  Queue.swift
//
//
//  Created by Yejin Hong on 3/18/24.
//

struct Queue<Element> {
    var list = LinkedList<Element>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    mutating func dequeue() -> Element? {
        return list.dequeue()
    }
    
    mutating func enqueue(_ value: Element) {
        list.enqueue(value)
    }
    
    mutating func peek() -> Element? {
        return list.peek()
    }
    
    mutating func clear() {
        list.clear()
    }
}
