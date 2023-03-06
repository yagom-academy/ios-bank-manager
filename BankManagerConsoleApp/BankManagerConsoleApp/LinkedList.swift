//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/06.
//

import Foundation

final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    func appendLast(value: T) {
        if head == nil {
            head = Node(value: value)
            tail = head
        } else {
            tail?.next = Node(value: value)
            tail = tail?.next
        }
    }
    
    @discardableResult
    func removeFirst() -> T? {
        guard head != nil else { return nil }
        
        let value = head?.value
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return value
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
