//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/29.
//

import Foundation

class Queue<Element> {
    private var linkedList = LinkedList<Element>()
    
    var peek: Element? {
        linkedList.peek?.data
    }
    
    var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    func enqueue(_ newElement: Element) {
        linkedList.append(data: newElement)
    }
    
    func dequeue() -> Element? {
        linkedList.pop()?.data
    }
    
    func clear() {
        linkedList.clear()
    }
}
