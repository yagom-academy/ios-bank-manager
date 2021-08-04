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
    
    mutating func append(_ node: Node<T>) {
        if isEmpty {
            head = node
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = node
    }
    
    mutating func removeFirst() -> T? {
        let currentHead = head
        if isEmpty == false {
            head = head?.next
        }
        return currentHead?.data
    }
    
    mutating func removeAll() {
        head = nil
    }
}

