//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    mutating func append(_ appendingNode: Node<T>) {
        if head == nil {
            head = appendingNode
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = appendingNode
    }
}
