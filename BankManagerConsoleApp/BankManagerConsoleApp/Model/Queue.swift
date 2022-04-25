//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 허윤영 on 25/04/2022.
//

import Foundation

struct Queue<Element> {
    private var items = LinkedList<Element>()
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var peek: Element? {
        return items.first
    }
    
    func enqueue(_ data: Element) {
        items.append(data)
    }
    
    func dequeue() -> Element? {
        return items.removeFirst()
    }
    
    func clear() {
        items.removeAll()
    }
}
