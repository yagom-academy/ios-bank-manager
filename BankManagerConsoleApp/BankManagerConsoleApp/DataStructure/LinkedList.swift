//
//  BankManagerConsoleApp - main.swift
//  Created by Taeangel, Tiana 2022/04/25.
//  Copyright © yagom academy. All rights reserved.
//

private final class Node<T> {
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
        guard head == nil else {
            return false
        }
        return true
    }
    
    func append(data: T) {
        let node = Node<T>(data: data)
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
