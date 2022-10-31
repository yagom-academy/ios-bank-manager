//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/10/31.
//

import Foundation

struct CustomerQueue<Element> {
    private var front: Node<Element>?
    private var rear: Node<Element>?
    
    func createNode(data: Element) -> Node<Element> {
        return Node(data: data)
    }
    
    mutating func enqueue(data: Element) {
        if front == nil {
            front = createNode(data: data)
            rear = front
        } else {
            rear?.next = createNode(data: data)
            rear = rear?.next
        }
    }
    
    mutating func dequeue() -> Element? {
        guard let value: Node<Element> = front else {
            return nil
        }
        front = front?.next
        
        return value.data
    }
    
    func peek() -> Node<Element>? {
        guard let result: Node<Element> = front else {
            return nil
        }
        
        return result
    }
}
