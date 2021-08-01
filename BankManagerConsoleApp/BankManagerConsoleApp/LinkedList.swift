//
//  BankManagerConsoleApp - LinkedList.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ appendingNode: Node<T>) {
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
    
    func removeFirst() {
        if isEmpty == false {
            head = head?.next
        }
    }
    
    func removeAll() {
        head = nil
    }
}
