//
//  WaitingLineLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

final class WaitingLineLinkedList<Element> {
    private(set) var head: WaitingLineNode<Element>?
    private var tail: WaitingLineNode<Element>?
    
    func append(_ node: WaitingLineNode<Element>) {
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    func removeFirst() -> WaitingLineNode<Element>? {
        let removeNode = head
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return removeNode
    }
    
    func clear() {
        head = nil
        tail = nil
    }
}
