//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/20.
//

import Foundation

struct Queue<Element> {
    private var linkedList = LinkedList<Element>()
    var first: Element? {
        linkedList.first
    }
    var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    mutating func enqueue(data: Element) {
        linkedList.append(data: data)
    }
    
    mutating func dequeue() -> Element? {
        linkedList.removeFirst()
    }
    
    mutating func removeAll() {
        linkedList.removeAll()
    }
}
