//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 1 on 2021/12/20.
//

import Foundation

class Node<Element> {
    var data: Element?
    var next: Node?
    
    init(data: Element?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    init(data: Element?){
        self.head = Node(data: data, next: nil)
        self.tail = head
    }
    
    mutating func append(data: Element) {
        let nextNode = Node(data: data, next: nil)
        tail?.next = nextNode
        tail = tail?.next
    }
}
