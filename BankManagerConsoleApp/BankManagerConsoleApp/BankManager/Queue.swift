//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/20.
//

import Foundation

struct Queue<Element> {
    
    private var list: LinkedList<Element> = LinkedList()
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
