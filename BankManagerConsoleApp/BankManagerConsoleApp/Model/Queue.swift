//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

struct Queue<Element> {
    private var linkedlist = LinkedList<Element>()
    
    var peek: Element? {
        return linkedlist.first
    }
    
    var isEmpty: Bool {
        return linkedlist.isEmpty
    }
    
    mutating func enqueue(_ data: Element) {
        linkedlist.append(data)
    }
    
    mutating func dequeue() -> Element? {
        return linkedlist.removeFirst()
    }
    
    mutating func clear() {
        linkedlist.removeAll()
    }
}
