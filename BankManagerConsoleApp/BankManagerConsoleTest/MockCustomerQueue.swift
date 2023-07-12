//
//  MockCustomerQueue.swift
//  BankManagerConsoleTest
//
//  Created by kyungmin, Max on 2023/07/10.

import XCTest

struct MockCustomerQueue<Element: Equatable>: QueueType {
    var linkedList = LinkedList<Element>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var headNode: Node<Element>? {
        return linkedList.headNode
    }
    
    var tailNode: Node<Element>? {
        return linkedList.tailNode
    }

    mutating func enqueue(_ value: Element) {
        linkedList.append(value)
    }
    
    @discardableResult
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
