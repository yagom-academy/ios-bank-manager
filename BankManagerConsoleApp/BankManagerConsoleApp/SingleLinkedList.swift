//
//  SingleLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/10.
//

struct SingleLinkedList<Element> {
    private var firstNode: Node<Element>?
    
    var isEmpty: Bool {
        return firstNode == nil
    }
    
    var peek: Element? {
        return firstNode?.data
    }
    
    mutating func currentFirstNode() -> Node<Element>? {
        return firstNode
    }
    
    mutating func clear() {
        firstNode = nil
    }
    
    mutating func enqueue(_ data: Element) {
        let node: Node<Element> = Node(data: data)

        guard !isEmpty else {
            firstNode = node
            
            return
        }
        
        var nextNode: Node<Element>? = firstNode
        
        while nextNode?.next != nil {
            nextNode = firstNode?.next
        }
        
        nextNode?.next = node
    }
    
    mutating func dequeue() -> Element? {
        let data: Element? = firstNode?.data
        firstNode = firstNode?.next
        
        return data
    }
}
