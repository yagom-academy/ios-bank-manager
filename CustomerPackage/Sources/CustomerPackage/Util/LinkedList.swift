//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

public final class LinkedList<Element> {
    private(set) var head: Node<Element>?
    private var tail: Node<Element>?
    
    public func append(_ node: Node<Element>) {
        if head == nil {
            head = node
        } else {
            tail?.next = node
        }
        tail = node
    }
    
    public func removeFirst() -> Node<Element>? {
        let removeNode = head
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return removeNode
    }
    
    public func clear() {
        head = nil
        tail = nil
    }
}
