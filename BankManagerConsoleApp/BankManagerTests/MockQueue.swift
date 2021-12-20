//
//  MockQueue.swift
//  BankManagerTests
//
//  Created by Jae-hoon Sim on 2021/12/20.
//

import Foundation

struct MockQueue<Element> {
    
    var list: LinkedList<Element> = LinkedList()
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(element: Element) {
        list.append(value: element)
    }
    
    mutating func dequeue() -> Element? {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func peek() -> Element? {
        return list.first
    }
}
