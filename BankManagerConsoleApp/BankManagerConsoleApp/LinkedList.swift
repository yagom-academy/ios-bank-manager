//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 잼킹 on 2021/07/28.
//

import Foundation

final class LinkedList<T> {
    private final class Node<T> {
        var data: T?
        var next: Node?
        
        init(data: T?, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
    
    private var head: Node<T>?
    
    func addLast(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    func removeFirst() -> T? {
        if head == nil {
            return nil
        }
        let copiedHead = head
        let value = copiedHead?.data
        head = copiedHead?.next
        copiedHead?.next = nil
        return value
    }
}
