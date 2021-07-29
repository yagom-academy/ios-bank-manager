//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/29.
//

import Foundation

class Queue<Element> {
    //TODO: peek, isEmpty
    private var linkedList = LinkedList<Element>()
    
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
