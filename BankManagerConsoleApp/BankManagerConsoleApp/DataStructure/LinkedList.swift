//
//  BankManagerConsoleApp - main.swift
//  Created by Taeangel, Tiana 2022/04/25.
//  Copyright © yagom academy. All rights reserved.
//

final class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        if head == nil {
            return true
        }
        
        return false
    }
    
    func append(node: Node<T>) {
        guard isEmpty == false else {
            head = node
            tail = node
            return
        }
        tail?.next = node
        tail = node
    }
    
    func removeFirst() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        if head?.next == nil {
            tail = nil
        }
        
        let data = head?.data
        head = head?.next
        return data
    }
    
    func clear() {
        head = nil
        tail = nil
    }
    
    func peek() -> T? {
        return head?.data
    }
}
