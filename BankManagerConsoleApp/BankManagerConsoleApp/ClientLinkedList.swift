//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 김민성 on 2021/04/29.
//

import Foundation

class ClientNode<T> {
    let value: T
    weak var previous: ClientNode?
    var next: ClientNode?

    init(value: T) {
        self.value = value
    }
}

struct LinkedList<T> {
    private(set) var head: ClientNode<T>?
    private(set) var tail: ClientNode<T>?

    var isEmpty: Bool {
        return self.head == nil
    }

    mutating func appendValue(_ value: T) {
        let new = ClientNode<T>(value: value)
        if self.isEmpty {
            self.head = new
        }
        self.tail?.next = new
        new.previous = self.tail
        self.tail = new
    }

    mutating func removeHead() -> T? {
        guard let head = self.head else { return nil }
        return self.removeNode(head)
    }

    mutating func removeNode(_ node: ClientNode<T>) -> T {
        if node === head, node === tail {
            head = nil
            tail = nil
            return node.value
        } else if node === head {
            defer {
                head = node.next
                head?.previous = nil
            }
            return node.value
        } else if node === tail {
            defer {
                tail?.previous = tail
                tail?.next = nil
            }
            return node.value
        } else {
            let before = node.previous
            let next = node.next
            before?.next = next
            next?.previous = before
            node.next = nil
            node.previous = nil

            return node.value
        }
    }
}

struct Queue<T> {
    private var linkedList = LinkedList<T>()
    var isEmpty: Bool {
        return self.linkedList.isEmpty
    }

    var front: T? {
        return self.linkedList.head?.value
    }

    var end: T? {
        return self.linkedList.tail?.value
    }

    mutating func enqueue(_ item: T) {
        self.linkedList.appendValue(item)
    }

    mutating func dequeue() -> T? {
        guard !self.isEmpty else { return nil }
        return self.linkedList.removeHead()
    }
}

