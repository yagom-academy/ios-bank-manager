//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 권나영 on 2021/12/20.
//

import Foundation

class LinkedList<Element> {
    var head: Node<Element>?
    
    func enqueue(data: Element) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil  {
            node = node?.next
        }
        
        node?.next = Node(data: data)
    }
}
