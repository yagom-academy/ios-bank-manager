//
//  BankManagerConsoleApp - LinkedList.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct LinkedList<T> {
    var head: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ appendingNode: Node<T>) {
        if isEmpty {
            head = appendingNode
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = appendingNode
    }
    
    mutating func removeFirst() {
        if isEmpty == false {
            head = head?.next
        }
    }
    
    mutating func removeAll() {
        head = nil
    }
}

