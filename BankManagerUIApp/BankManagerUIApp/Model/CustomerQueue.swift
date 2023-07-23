//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by kyungmin, Max on 2023/07/20.
//

import Foundation

struct CustomerQueue<Element: Equatable>: QueueType {
    private var linkedList = LinkedList<Element>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
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
}

