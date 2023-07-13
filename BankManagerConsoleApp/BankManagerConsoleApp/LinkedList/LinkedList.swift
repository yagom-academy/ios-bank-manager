//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/11.
//

struct LinkedList<Element: Equatable> {
    private(set) var headNode: Node<Element>?
    private(set) var tailNode: Node<Element>?
    
    var isEmpty: Bool {
        return headNode == nil
    }
    
    mutating func append(_ value: Element) {
        let node: Node = Node(value)
        
        if self.isEmpty {
            self.headNode = node
            self.tailNode = node
        } else {
            self.tailNode?.nextNode = node
            self.tailNode = node
        }
    }
    
    mutating func pop() -> Element? {
        guard let headNode else {
            return nil
        }
        
        if headNode.nextNode == nil {
            self.removeAll()
        } else {
            self.headNode = headNode.nextNode
        }
        
        return headNode.element
    }
    
    mutating func removeAll() {
        self.headNode = nil
        self.tailNode = nil
    }
    
    func peek() -> Element? {
        guard let value = headNode?.element else {
            return nil
        }
        
        return value
    }
}

