//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 서녕 on 2021/12/20.
//

import Foundation

class Node<Element> {
    let value: Element
    var next: Node?
    
    init(value: Element, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    mutating func addNode(_ value: Element) {
        let node = Node(value: value)
        
        if head == nil {
            head = node
            tail = head
        } else if head === tail {
            head?.next = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    mutating func deleteFirstNode() {
        head = head?.next
    }
    
}
