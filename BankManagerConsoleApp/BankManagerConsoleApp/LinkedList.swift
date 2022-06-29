//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by bonf, judy on 2022/06/27.
//

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    func firstNode() throws -> Node<T> {
        guard let firstNode = head else {
            throw QueueError.nilOfValue
        }
        
        return firstNode
    }

    func append(_ value: T) {
        let newNode = Node<T>(value)

        if let tailNode = tail {
            tail = newNode
            tailNode.next = tail
        } else {
            head = newNode
            tail = newNode
        }
    }

    func removeHead() throws -> Node<T> {
        guard let node = head else {
            throw QueueError.nilOfValue
        }
        
        if let next = head?.next {
            head = next
        } else {
            head = nil
            tail = nil
        }
        
        return node
    }

    func removeAll() {
        while head?.next == tail {
            let next = head?.next
            head = nil
            head = next
        }
        head = nil
        tail = nil
    }
}
