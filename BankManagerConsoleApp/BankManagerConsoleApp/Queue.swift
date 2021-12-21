//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 서녕 on 2021/12/20.
//

import Foundation

struct Queue<Element> {
    private(set) var linkedList = LinkedList<Element>()
    
    mutating func enqueue(_ value: Element) {
        linkedList.addNode(value)
    }
    
    mutating func dequeue() -> Element? {
        let dequeueItem = peek()
        
        linkedList.deleteFirstNode()
        return dequeueItem
    }
    
    mutating func clear() {
        linkedList.clear()
    }
    
    mutating func peek() -> Element? {
        guard let peekItem = linkedList.head?.value else {
            return nil
        }
                                
        return peekItem
    }
    
    func isEmpty() -> Bool {
        linkedList.head == nil
    }
}
