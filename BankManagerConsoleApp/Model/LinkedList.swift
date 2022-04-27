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
    var isNil: Bool {
        if (head == nil) || (tail == nil) {
            return true
        } else {
            return false
        }
    }

    mutating private func setIfIsNil(node: Node<T>) -> Bool {
        if isNil {
            head = node
            tail = node
            return true
        }
        return false
    }

    mutating func appendTail(element: T) {
        let node = Node(element: element)

        if setIfIsNil(node: node) {
            return
        }

        tail?.setNextNode(node)
        tail = node
    }

    mutating func removeFirst() -> T? {
        guard let data = head?.data() else {
            return nil
        }

        head = head?.next()
        return data
    }

    mutating func clear() {
        head = nil
        tail = nil
    }

    func headData() -> T? {
        return head?.data()
    }
}
