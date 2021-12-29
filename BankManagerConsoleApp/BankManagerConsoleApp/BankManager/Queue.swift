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
    
    func enqueue(_ element: Element) {
        list.append(element)
    }
    
    func dequeue() -> Element? {
        return list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
    
    func peek() -> Element? {
        return list.first
    }
}
