//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/20.
//

import Foundation

class Queue<Element> {
    private var linkedList = LinkedList<Element>()
    var first: Element? {
        linkedList.first
    }
    var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    func enqueue(_ data: Element) {
        linkedList.append(data: data)
    }
    
    @discardableResult
    func dequeue() -> Element? {
        linkedList.removeFirst()
    }
    
    func removeAll() {
        linkedList.removeAll()
    }
}
