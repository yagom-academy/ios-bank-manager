//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import Foundation

final class LinkedList<T> {
    private var head: Node<T>?
    var isEmpty: Bool {
        if head != nil {
            return false
        }
        return true
    }
    var peek: T? {
        return head?.data
    }
    
    func append(data: T) {
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
    
    @discardableResult
    func removeFirst() -> T? {
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
}
