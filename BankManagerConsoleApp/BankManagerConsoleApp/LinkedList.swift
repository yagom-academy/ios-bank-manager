//
//  LinkedList.swift
//  Created by sunnycookie, inho
//

import Foundation

struct LinkedList<T> {
    private(set) var head: Node<T>?
    var last: Node<T>? {
        var currentNode = head
        
        while currentNode != nil {
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
    var isEmpty: Bool {
        return head == nil ? true : false
    }
    
    mutating func append(_ data: T) {
        guard head != nil else {
            head = Node(data: data)
            return
        }
        
        if last?.next == nil {
            last?.next = Node(data: data)
        }
    }
    
    mutating func removeFirst() -> T? {
        let currentData = head?.data
        head = head?.next
        
        return currentData
    }
    
    mutating func removeAll() {
        head = nil
    }
}
