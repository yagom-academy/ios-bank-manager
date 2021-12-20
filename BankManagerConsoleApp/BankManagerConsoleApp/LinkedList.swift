//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Seul Mac on 2021/12/20.
//

import Foundation

class LinkedList<Element> {
    
    var head: Node<Element>?
    var tail: Node<Element>?
    
    func enqueue(data: Element) {
        if head == nil {
            head = Node(data: data, next: nil)
            tail = head
        } else {
            tail?.next = Node(data: data, next: nil)
            tail = tail?.next
        }
    }

}
