//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Jae-hoon Sim on 2021/12/20.
//

import Foundation

struct LinkedList<Element> {
    
    private final class Node<Value> {
        
        var value: Value
        var next: Node<Value>?
        
        init(_ value: Value) {
            self.value = value
        }
    }
    
    private var head: Node<Element>?
    private var tail: Node<Element>?
    var isEmpty: Bool {
        return head == nil
    }
    var first: Element? {
        return head?.value
    }
    
    mutating func append(_ value: Element) {
        guard !isEmpty else {
            head = Node(value)
            tail = head
            return
        }
        tail?.next = Node(value)
        tail = tail?.next
    }
    
    mutating func removeFirst() -> Element? {
        guard let firstNode = head else {
            return nil
        }
        let result = firstNode.value
        head = firstNode.next
        return result
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
