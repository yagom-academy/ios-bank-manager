//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/25.
//

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    var peek: T? {
        return head?.data
    }

    func removeAll() {
        head = nil
        tail = nil
    }

    func append(data: T) {
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

    func pop() -> T? {
        guard head != nil else {
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
