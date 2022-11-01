//  BankManagerConsoleApp - Queue.swift
//  Created by Ayaan/Dragon/som on 2022/10/31.
//  Copyright © yagom academy. All rights reserved.

struct Queue<Element: Equatable> {
    private var linkedList: LinkedList<Element> = LinkedList<Element>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var first: Element? {
        return linkedList.first
    }
    
    var last: Element? {
        return linkedList.last
    }
    
    mutating func enqueue(_ data: Element) {
        linkedList.append(data)
    }
    
    mutating func dequeue() -> Element? {
        return linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> Element? {
        return first
    }
}
