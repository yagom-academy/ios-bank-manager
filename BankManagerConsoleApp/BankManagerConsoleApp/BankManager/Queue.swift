//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/20.
//

import Foundation

struct Queue<Element> {
    
    private var list = LinkedList<Element>()
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        list.append(element)
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
