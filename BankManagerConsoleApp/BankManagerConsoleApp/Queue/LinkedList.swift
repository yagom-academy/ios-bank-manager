//
//  LinkedList.swift
//  Created by sunnycookie, inho
//

import Foundation

struct LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var last: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: T) {
        guard head != nil else {
            head = Node(data: data)
            last = head
            return
        }
        
        last?.next = Node(data: data)
        last = last?.next
    }
    
    mutating func removeFirst() -> T? {
        let currentData = head?.data
        head = head?.next
        
        return currentData
    }
    
    mutating func removeAll() {
        head = nil
        last = nil
    }
}
