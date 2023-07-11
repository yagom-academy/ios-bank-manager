//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/11.
//

struct LinkedList<Element> {
    private(set) var headNode: Node<Element>?
    private(set) var tailNode: Node<Element>?
    
    mutating func append(_ value: Element) {
        let node: Node = Node(value)
        
        if self.isEmpty() {
            self.headNode = node
            self.tailNode = node
        } else {
            self.tailNode?.nextNode = node
            self.tailNode = node
        }
    }
    
    mutating func pop() -> Element? {
        guard let firstNode = headNode else {
            return nil
        }
        
        if let _ = firstNode.nextNode {
            self.headNode = firstNode.nextNode
        } else {
            self.removeAll()
        }
        
        return firstNode.value
    }
    
    mutating func removeAll() {
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
        return headNode == nil
    }
}

