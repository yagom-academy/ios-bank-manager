//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/10.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: Element? {
        guard let head else {
            return nil
        }
        
        return head.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    mutating func enqueue(_ data: Element) {
        let node: Node<Element> = Node(data: data)
        
        tail?.next = node
        tail = node
    }
    
    mutating func dequeue() -> Element? {
        let value: Element? = head?.data
        head = head?.next
        
        return value
    }
}
