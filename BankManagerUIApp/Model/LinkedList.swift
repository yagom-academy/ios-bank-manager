//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Jun Bang on 2021/12/21.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var firstNode: Node<T>? {
        return head
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(data: T) {
        let newNode = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
}
