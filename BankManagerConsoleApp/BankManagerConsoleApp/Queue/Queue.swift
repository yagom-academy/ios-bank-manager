//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/20.
//

import Foundation

struct Queue<Element> {
    var linkedList = LinkedList<Element>()
    var first: Element? {
        linkedList.first
    }
    var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    func enqueue(data: Element) {
        linkedList.enqueue(data: data)
    }
    
    func dequeue() -> Element? {
        linkedList.dequeue()
    }
    
    func removeAll() {
        linkedList.removeAll()
    }
}
