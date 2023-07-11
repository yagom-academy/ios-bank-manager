//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

struct CustomerQueue<Element>: QueueType {
    private var linkedList = LinkedList<Element>()
    
    mutating func enqueue(_ value: Element) {
        linkedList.append(value)
    }
    
    mutating func dequeue() -> Element? {
        return linkedList.pop()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> Element? {
        return linkedList.peek()
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
}
