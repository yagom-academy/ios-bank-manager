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
    
    
    func enqueue(data: T) {
        let node = Node<T>(data: data)
        
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
        
        let returnData = head?.data
        
        head?.next?.previous = nil
        head = head?.next
        
        return returnData
    }
}
