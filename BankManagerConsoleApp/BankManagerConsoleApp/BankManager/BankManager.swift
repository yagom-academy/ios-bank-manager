//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class SinglyLinkedListNode<T> {
    
    var value: T
    var next: SinglyLinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

struct SinglyLinkedList<T> {
    
    var head: SinglyLinkedListNode<T>?
    var tail: SinglyLinkedListNode<T>?
    
    mutating func append(value: T) {
        guard let head = self.head else {
            self.head = SinglyLinkedListNode(value: value)
            self.tail = self.head
            return
        }
        
        var currentNode = head
        while let next = currentNode.next {
            currentNode = next
        }
        currentNode.next = SinglyLinkedListNode(value: value)
        self.tail = currentNode.next
    }
    
    mutating func removeFirst() -> T? {
        guard let head = self.head else {
            return nil
        }
        let result = head.value
        self.head = head.next
        return result
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
