//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/21.
//

import Foundation

class Queue<Element> {
    private var items = LinkedList<Element>()
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    func enqueue(value: Element) {
        items.append(value: value)
    }
    
    func dequeue() -> Element? {
        items.removeFirst()
    }
    
    func clear() {
        items.removeAll()
    }
    
    func peek() -> Element? {
        items.retrieveFirst()
    }
}
