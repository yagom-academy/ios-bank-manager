//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Jae-hoon Sim on 2021/12/20.
//

import Foundation

struct LinkedList<Element> {
    
    private class Node<Value> {
        
        var value: Value
        var next: Node<Value>?
        
        init(value: Value) {
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
    
    mutating func append(value: Element) {
        guard var currentNode = head else {
            head = Node(value: value)
            tail = head
            return
        }
        while let next = currentNode.next {
            currentNode = next
        }
        currentNode.next = Node(value: value)
        tail = currentNode.next
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
