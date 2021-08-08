//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/29.
//

import Foundation

struct Queue<Element> {
    private var linkedList = LinkedList<Element>()
    
    var peek: Element? {
        linkedList.peek?.data
    }
    
    var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    mutating func enqueue(_ newElement: Element) {
        linkedList.append(data: newElement)
    }
    
    mutating func dequeue() -> Element? {
        linkedList.pop()?.data
    }
    
    mutating func clear() {
        linkedList.clear()
    }
}
