//
//  WaitingLineLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

final class WaitingLineLinkedList<T> {
    private(set) var head: WaitingLineNode<T>?
    private var tail: WaitingLineNode<T>?
    
    func append(_ node: WaitingLineNode<T>) {
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    func removeFirst() -> WaitingLineNode<T>? {
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
