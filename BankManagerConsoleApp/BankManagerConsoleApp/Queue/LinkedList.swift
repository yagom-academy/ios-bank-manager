//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 권나영 on 2021/12/20.
//

import Foundation

class LinkedList<Element> {
    private var head: Node<Element>?
    var first: Element? {
        head?.data
    }
    var isEmpty: Bool {
        head == nil
    }
    
    func append(data: Element) {
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
    
    func removeFirst() -> Element? {
        if head == nil {
            return nil
        }
        
        let firstElement = head?.data
        head = head?.next
        
        return firstElement
    }
    
    func removeAll() {
        head = nil
    }
}
