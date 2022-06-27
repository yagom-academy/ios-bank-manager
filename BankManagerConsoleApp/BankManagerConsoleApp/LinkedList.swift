//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    
    func enqueue(data: T) {
        if head == nil {
            head = Node(data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data)
    }
    
    func dequeue() -> T? {
        if head == nil {
            return nil
        }
        
        let removedNode = head
        head = head?.next
        
        return removedNode?.data
    }
    
    func clear() {
        head = nil
    }
    
    func peek() -> T? {
        return head?.data
    }
    
    func isEmpty() -> Bool {
        if head != nil {
            return false
        }
        return true
    }
}
