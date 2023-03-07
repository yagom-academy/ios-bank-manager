//
//  LinkedList.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: T? {
        return head?.data
    }
    
    mutating func append(_ data: T) {
        let node = Node(data: data)
        if isEmpty {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
