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
    private var count = Int.zero
    
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
            count += 1
            return
        }
        
        tail?.next = node
        count += 1
    }
    
    func removeFirst() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        if count == 1 {
            tail = nil
        }
        
        count -= 1
        let data = head?.data
        head = head?.next
        return data
    }
    
    func clear() {
        head = nil
        tail = nil
        count = Int.zero
    }
    
    func peek() -> T? {
        return head?.data
    }
}
