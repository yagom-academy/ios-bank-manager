//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

struct CustomerQueue<Element>: QueueType {
    private var headNode: CustomerNode<Element>?
    private var tailNode: CustomerNode<Element>?
    
    mutating func enqueue(_ value: Element) {
        let node: CustomerNode = CustomerNode(value)
        
        if self.isEmpty() {
            self.headNode = node
            self.tailNode = node
        } else {
            self.tailNode?.setNextNode(node)
            self.tailNode = node
        }
    }
    
    mutating func dequeue() -> Element? {
        guard let value = headNode?.value, self.isEmpty() == false else {
            return nil
        }
        
        if headNode === tailNode {
            self.clear()
            
            return value
        } else {
            self.headNode = headNode?.nextNode
            
            return value
        }
    }
    
    mutating func clear() {
        self.headNode = nil
        self.tailNode = nil
    }
    
    func peek() -> Element? {
        guard let value = headNode?.value else {
            return nil
        }
        
        return value
    }
    
    func isEmpty() -> Bool {
        if headNode == nil {
            return true
        } else {
            return false
        }
    }
}
