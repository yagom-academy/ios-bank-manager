//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/25.
//

import Foundation

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    var peek: T? {
        return head?.data
    }

    mutating func clear() {
        if head == nil {
            return
        }
        while head == nil {
            _ = deQueue()
        }
    }

    mutating func enQueue(data: T) {
        let node = Node(data: data)
        if head == nil {
            head = node
            tail = node
        } else {
            node.previous = tail
            tail?.next = node
            tail = node
        }
    }
    mutating func deQueue() -> T? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            let data = head?.data
            head = nil
            tail = nil
            return data
        } else {
            let data = head?.data
            head = head?.next
            head?.previous = nil
            return data
        }
    }
}
