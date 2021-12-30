//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Jun Bang on 2021/12/21.
//

import Foundation

class Node<Element> {
    var data: Element
    var next: Node?
    
    init(data: Element) {
        self.data = data
    }
}

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var firstNode: Node<Element>? {
        return head
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: Element) {
        let newNode = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    mutating func removeFirst() -> Element? {
        let node = head
        head = node?.next

        return node?.data
    }
    
    mutating func removeAll() {
        head = nil
    }
}
