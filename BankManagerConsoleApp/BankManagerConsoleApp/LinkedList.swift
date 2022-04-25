//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/25.
//

import Foundation

class LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?

    var isEmpty: Bool {
        return head == nil
    }

    var peek: Element? {
        return head?.data
    }

    func append(_ data: Element) {
        let newNode = Node(data: data)
      
        if head == nil {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }

    func removeFirst() -> Element? {
        if head == nil {
            return nil
        }

        let target = head?.data

        if head === tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }

        return target
    }

    func clear() {
        head = nil
        tail = nil
    }
}
