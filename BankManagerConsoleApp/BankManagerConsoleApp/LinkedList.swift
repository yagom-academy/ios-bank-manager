//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by LeeChiheon on 2022/06/27.
//

import Foundation

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    
    mutating func enqueue(data: T) {
        var node = Node<T>(data: data)
        
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.previous = tail
            tail = node
        }
    }
}
