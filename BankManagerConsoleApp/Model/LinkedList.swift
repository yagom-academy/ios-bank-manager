//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/26.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil || tail == nil
    }
    var data: T? {
        return head?.data
    }

    mutating func appendTail(data: T) {
        let node = Node(data: data)

        if isEmpty {
            head = node
            tail = node
            return
        }

        tail?.nextNode = node
        tail = node
    }

    @discardableResult mutating func removeFirst() -> T? {
        guard let data = head?.data else {
            return nil
        }

        head = head?.nextNode
        return data
    }

    mutating func clear() {
        head = nil
        tail = nil
    }
}
