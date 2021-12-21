//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 권나영 on 2021/12/20.
//

import Foundation

final private class Node<Element> {
    var data: Element
    var next: Node?
    
    init(data: Element) {
        self.data = data
    }
}

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    var first: Element? {
        head?.data
    }
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func append(data: Element) {
        let newNode = Node(data: data)
        
        if let node = tail {
            node.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    mutating func removeFirst() -> Element? {
        if head == nil {
            return nil
        }
        
        let firstElement = head?.data
        head = head?.next
        
        return firstElement
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
