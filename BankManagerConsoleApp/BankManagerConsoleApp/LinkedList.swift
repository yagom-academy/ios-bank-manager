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
        guard let _ = tail else {
            head = node
            tail = node
            count += 1
            return
        }
        tail?.next = node
        count += 1
    }
}
