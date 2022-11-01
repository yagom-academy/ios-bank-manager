//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/10/31.
//

import Foundation

struct CustomerQueue<Element> {
    private(set) var front: Node<Element>?
    private(set) var rear: Node<Element>?
    
    func createNode(data: Element) -> Node<Element> {
        return Node(data: data)
    }
    
    mutating func enqueue(data: Element) {
        if self.isEmpty() {
            front = createNode(data: data)
            rear = front
        } else {
            rear?.next = createNode(data: data)
            rear = rear?.next
        }
    }
    
    mutating func dequeue() -> Element? {
        guard let result: Node<Element> = front else {
            return nil
        }
        front = front?.next
        
        return result.data
    }
    
    func peek() -> Node<Element>? {
        guard let result: Node<Element> = front else {
            return nil
        }
        
        return result
    }
    
    mutating func clear() {
        front = nil
    }
    
    func isEmpty() -> Bool {
        return front == nil ? true : false
    }
}
