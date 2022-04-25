//
//  BankManagerConsoleApp - main.swift
//  Created by Taeangel, Tiana.
//  Copyright © yagom academy. All rights reserved.
//

final class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count = 0
    
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
        count -= 1
        let data = head?.data
        head = head?.next
        return data
    }
    
    func clear() {
        head = nil
        tail = nil
        count = 0
    }
}
