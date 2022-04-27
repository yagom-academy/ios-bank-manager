//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/25.
//

final class LinkedList<Element>: Listable {
    private var head: Node<Element>?
    private var tail: Node<Element>?

    var isEmpty: Bool {
        return head == nil
    }

    var first: Element? {
        return head?.data
    }

    var last: Element? {
        return tail?.data
    }

    func append(value: Element) {
        let node = Node(data: value)
        if head == nil {
            head = node
            tail = node
        } else {
            node.previous = tail
            tail?.next = node
            tail = node
        }
    }

    func removeAll() {
        head = nil
        tail = nil
    }

    func removeFirst() -> Element? {
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
