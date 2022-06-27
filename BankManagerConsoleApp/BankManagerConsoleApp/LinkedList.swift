//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by LeeChiheon on 2022/06/27.
//

import Foundation

final class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var nodeCount: Int = 0
    var isEmpty: Bool {
        nodeCount == 0 ? true : false
    }
    var peek: T? {
        head?.data
    }
    
    func enqueue(data: T) {
        let node = Node<T>(data: data)
        nodeCount += 1
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.previous = tail
            tail = node
        }
    }
    
    func dequeue() -> T? {
        nodeCount -= 1
        let returnData = head?.data
        
        head?.next?.previous = nil
        head = head?.next
        
        return returnData
    }
    
    func clear() {
        while nodeCount != 0 {
            head = head?.next
            head?.previous?.next = nil
            head?.previous = nil
            nodeCount -= 1
        }
        
        head = nil
        tail = nil
    }
}
